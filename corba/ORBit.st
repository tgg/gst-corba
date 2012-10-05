CStruct subclass: ORBitRootObject [
    <category: 'ORBit'>
    <comment: nil>
    <declaration: #( (#interface (#ptr #CObject))
                     (#ref #long) )>
]

CStruct subclass: ORBitTypeCode [
    <category: 'ORBit'>
    <comment: nil>
    <declaration: #( (#parent #{ORBitRootObject})
                     (#kind #uLong)
                     (#flags #uLong)
                     (#cLength #short)
                     (#cAlign #short)
                     (#length #uLong)
                     (#subParts #uLong)
                     (#subTypes (#ptr (#ptr #{ORBitTypeCode})))
                     (#discriminator (#ptr #{ORBitTypeCode}))
                     (#name #string)
                     (#repoId #string)
                     (#subNames (#ptr #string))
                     (#subLabels (#ptr #long))
                     (#defaultIndex #long)
                     (#recurseDepth #uLong)
                     (#digits #uShort)
                     (#scale #short) )>
]

CStruct subclass: ORBitAny [
    <category: 'ORBit'>
    <comment: nil>
    <declaration: #( (#tc (#ptr #{ORBitTypeCode}))
                     (#val (#ptr #CObject))
                     (#release #uChar) )>

    ORBitAny class >> new [
        <cCall: 'CORBA_any__alloc' returning: #{ORBitAny} args: #(#void)>
    ]

    ORBitAny class >> withTypeCode: anORBitTypeCode value: aCObject [
        | any |
        any := self new.
        any tc value: anORBitTypeCode.
        any val value: aCObject.
        ^any
    ]

    ORBitAny class >> withObjectType: aCObjectType value: aCObject [
        ^self withTypeCode: aCObjectType typeCode value: aCObject
    ]

    free [
        <cCall: 'CORBA_free' returning: #void args: #(#self)>
    ]

    ORBitAny class >> sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_CORBA_any_struct'
    ]

    ORBitAny class >> typeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_any_struct'
    ]

    value: anObject [
        | any |
        any := anObject asORBitAny.
        self tc value: any tc value.
        self val value: any val value.
        self release value: any release value
    ]

    value [
        | tcKind matching |
        "For basic TypeCode address can differ"
        tcKind := self tc value kind value.
        matching := CObject selectSubclasses: [
            :sub | (sub respondsTo: #tcKind) and: [sub tcKind = tcKind]
        ].
        matching size = 1
            ifFalse: [
                | tcAddress |
                tcAddress := self tc value address.
                matching := CObject selectSubclasses: [
                    :sub | (sub respondsTo: #typeCode) and: [sub typeCode address = tcAddress]
                ]
            ].
        ^matching size = 1
            ifTrue: [
                | type ptrType |
                type := (matching asArray at: 1) type.
                ptrType := type ptrType.
                (self val castTo: ptrType) value value]
            ifFalse: [nil]
    ]
]

CStruct subclass: ORBitEnvironment [
    <category: 'ORBit'>
    <comment: nil>
    <declaration: #( (#id (#ptr #char))
                     (#major #uLong)
                     (#any #{ORBitAny}) )>

    ORBitEnvironment class >> new [
        <cCall: 'CORBA_exception__alloc' returning: #{ORBitEnvironment} args: #(#void)>
    ]

    free [
        <cCall: 'CORBA_free' returning: #void args: #(#self)>
    ]

    reset [
        <cCall: 'CORBA_exception_free' returning: #void args: #(#self)>
    ]

    id [
        <cCall: 'CORBA_exception_id' returning: #string args: #(#self)>
    ]

    raise [
        | e |
        e := CORBAConstants at: (CORBAMapper repoIdToCORBAConstantsKey: self id).
        "TODO: how can we retrieve exception members here?"
        self reset.
        e corbaRaise
    ]

    raiseOrDo: aBlock [
        ^self major value = 0 ifTrue: [aBlock value] ifFalse: [self raise]
    ]
]

CObject subclass: ORBitObject [
    | environment id orb |

    environment [        
        environment ifNil: [environment := ORBitEnvironment new].
        ^environment
    ]

    isA: aString [
        | r |
        r := self isA: aString environment: self environment.
        ^self environment raiseOrDo: [r ~= $0]
    ]

    isA: aString environment: anEnvironment [
        <cCall: 'CORBA_Object_is_a' returning: #uChar args: #(#self #string (#ptr #{ORBitEnvironment}))>
    ]

    id: aString [
        id := aString
    ]

    id [
        ^id
    ]

    orb: anORB [
        orb := anORB
    ]

    orb [
        ^orb
    ]

    ORBitObject class >> sizeof [
        ^CPtrSize
    ]

    value [
        ^self
    ]
]

CORBAORB subclass: ORBitORB [
    | orb environment id |

    <category: 'ORBit'>
    <comment: nil>

    ORBitORB class >> new: aString withArgs: aStringArray [
        | env argc argv i orb |
        env := ORBitEnvironment new.
        argc := CInt gcValue: aStringArray size + 1.
        argv := (CStringType arrayType: argc value) gcNew.
        i := 0.
        aStringArray do: [:arg | argv at: i put: arg. i := i + 1].
        orb := self orbInit: argc args: argv id: aString environment: env.
        ^self new orb: orb; environment: env; id: aString; yourself
    ]

    "I was not able to find a way to extract the type id from an IOR in ORBit.
Thus we do it ourselves.

Format is IOR:<BO><PAD><ULEN>[<TYPE_ID...>][<PROFILES...>]

For now, let's be bold and jump to TYPE_ID, up to the first NUL.

The good way to do this should be to use streams."
    ORBitORB class >> typeId: anIOR [
        | hexString len char offset str |
        anIOR ifNil: [
            SystemExceptions.InvalidArgument signalOn: anIOR reason: 'not allowed'
        ].
        (anIOR copyFrom: 1 to: 4) = 'IOR:' ifFalse: [
            SystemExceptions.InvalidArgument signalOn: anIOR reason: 'does not start with IOR:'
        ].
        len := anIOR size.
        len < 21 ifTrue: [
            SystemExceptions.InvalidArgument signalOn: anIOR reason: 'length too short'
        ].
        offset := 21.
        str := ''.
        [offset < len and: [
            char := self readHexChar: anIOR from: offset.
            char ~= Character nul]
        ] whileTrue: [
            offset := offset + 2.
            str := str, char asString.
        ].
        ^str
    ]

    ORBitORB class >> readHexChar: aString from: offset [
        ^(Number readFrom: ((aString copyFrom: offset to: offset + 1) readStream) radix: 16) asCharacter.
    ]

    orb: aCObject [
        orb := aCObject
    ]

    environment: anEnvironment [
        environment := anEnvironment
    ]

    id: aString [
        id := aString
    ]

    id [
        ^id
    ]

    bootstrap: aCORBAObject with: anEnvironment [
        | typeId obj matching |
        obj := aCORBAObject.
        ^anEnvironment raiseOrDo: [
            typeId := self class typeId: (self objectToString: obj).
            matching := ORBitObject selectSubclasses: [
                :sub | (sub respondsTo: #typeId) and: [sub typeId = typeId]
            ].
            "TODO: we avoid problems here."
            matching size = 1 ifTrue: [obj := obj castTo: (matching asArray at: 1) type].
            obj id: typeId; orb: self; yourself
        ]
    ]

    bootstrap: aCORBAObject [
        ^self bootstrap: aCORBAObject with: environment
    ]

    stringToObject: aString [
        | obj typeId matching |
        ^aString
          ifNotNil: [
              obj := self class stringToObject: orb string: aString environment: environment.
              self bootstrap: obj with: environment
          ]
          ifNil: [nil]
    ]

    objectToString: aCORBAObject [
        ^self class objectToString: orb object: aCORBAObject environment: environment
    ]

    ORBitORB class >> orbInit: anInt args: aStringArray id: aString environment: anEnvironment [
        <cCall: 'CORBA_ORB_init' returning: #cObject args: #((#ptr #int) (#ptr #string) #string (#ptr #{ORBitEnvironment}))>
    ]

    ORBitORB class >> stringToObject: anORB string: aString environment: anEnvironment [
        <cCall: 'CORBA_ORB_string_to_object' returning: #{ORBitObject} args: #(#cObject #string (#ptr #{ORBitEnvironment}))>
    ]

    ORBitORB class >> objectToString: anORB object: aCORBAObject environment: anEnvironment [
        <cCall: 'CORBA_ORB_object_to_string' returning: #string args: #(#cObject #cObject (#ptr #{ORBitEnvironment}))>
    ]
]

CStruct subclass: ORBitSequence [
    <category: 'ORBit'>
    <comment: nil>
    <declaration: #( (#maximum #uLong)
                     (#length #uLong)
                     (#buffer (#ptr #CObject))
                     (#release #uChar) )>

    | arrayType |

    ORBitSequence class >> new: anInteger type: aCObjectType [
        | sequence |
        sequence := self allocSeq: aCObjectType sequenceTypeCode.
        sequence reserve: anInteger type: aCObjectType.
        ^sequence
    ]

    ORBitSequence class >> allocBuf: aTypeCodeAddress size: anInteger [
        <cCall: 'ORBit_small_allocbuf' returning: #cObject args: #(#cObject #uLong)>
    ]

    reserve: anInteger type: aCObjectType [
        | buffer |
        self maximum value: anInteger.
        self length value: anInteger.
        self arrayType: aCObjectType.
        buffer := (anInteger ~= 0)
            ifTrue: [self class allocBuf: aCObjectType sequenceTypeCode size: anInteger]
            ifFalse: [0].
        self buffer value: buffer.
        "Always free the sequence on #free"
        self release value: $1
    ]

    arrayType: aCObjectType [
        arrayType := aCObjectType
    ]

    arrayTypeOf: aCObjectType [
        ^self class arrayTypeOf: aCObjectType numberOfElements: self length value
    ]

    ORBitSequence class >> arrayTypeOf: aCObjectType numberOfElements: anInteger [
        ^(aCObjectType inheritsFrom: CORBA.ORBitObject)
            ifTrue: [(CPtrCType elementType: aCObjectType type) arrayType: anInteger]
            ifFalse: [aCObjectType type arrayType: anInteger].
    ]

    ORBitSequence class >> allocSeq: aTypeCodeAddress [
        <cCall: 'ORBit_small_alloc' returning: #{ORBitSequence} args: #(#cObject)>
    ]

    bufferAt: anIndex [
        ^self bufferAt: anIndex type: arrayType
    ]

    bufferAt: anIndex type: aType [
        ^(self buffer value castTo: (self arrayTypeOf: aType)) at: anIndex
    ]

    bufferAt: anIndex put: aValue [
        ^self bufferAt: anIndex put: aValue type: arrayType
    ]

    bufferAt: anIndex put: aValue type: aType [
        ^(self buffer value castTo: (self arrayTypeOf: aType)) at: anIndex put: aValue
    ]

    free [
        <cCall: 'CORBA_free' returning: #void args: #(#self)>
    ]

    asOrderedCollectionOf: aCObjectType [
        | col len i |
        len := self length value.
        col := OrderedCollection new: len.
        i := 0.
        [i < len] whileTrue: [ col add: (self bufferAt: i type: aCObjectType). i := i + 1].
        ^col
    ]

    asOrderedCollection [
        ^self asOrderedCollectionDo: [:e | e]
    ]

    value [
        ^self asOrderedCollection
    ]

    asOrderedCollectionDo: aBlock [
        | col len i |
        len := self length value.
        col := OrderedCollection new: len.
        i := 0.
        [i < len] whileTrue: [ col add: (aBlock value: (self bufferAt: i)). i := i + 1].
        ^col
    ]

    value: aCollection type: aCObjectType [
        aCollection isNil ifFalse: [
            self reserve: aCollection size type: aCObjectType.
            aCollection asOrderedCollection keysAndValuesDo: [:i :e | self bufferAt: i - 1 put: e type: aCObjectType]
        ]
    ]

    ORBitSequence class >> from: anORBitSequence type: aCObjectType orb: anORBitORB [
        anORBitSequence arrayType: aCObjectType.
        ^[(aCObjectType inheritsFrom: CORBA.ORBitObject)
            ifFalse: [anORBitSequence asOrderedCollection]
            ifTrue: [anORBitSequence asOrderedCollectionDo: [:e | anORBitORB bootstrap: e]]
        ] ensure: [anORBitSequence free]
    ]
]

OrderedCollection extend [
    asORBitSequenceOf: aCObjectType [
        | sequence |
        sequence := CORBA.ORBitSequence new: self size type: aCObjectType.
        self keysAndValuesDo: [:i :e | sequence bufferAt: i - 1 put: e].
        ^sequence
    ]
]

Number extend [
    asORBitAny [
        | klass any |
        klass := (self < 0) ifTrue: [
            (self < (-2 raisedTo: 63)) ifTrue: [
                SystemExceptions.ArgumentOutOfRange
                    signalOn: self
                    mustBeBetween: (-2 raisedTo: 63)
                    and: ((2 raisedTo: 64) - 1)
            ].
            (self < (-2 raisedTo: 31))
                ifTrue: [CLongLong]
                ifFalse: [
                    self < (-2 raisedTo: 15)
                        ifTrue: [CLong]
                        ifFalse: [CShort]
                ]
        ] ifFalse: [
            (self > ((2 raisedTo: 64) - 1)) ifTrue: [
                SystemExceptions.ArgumentOutOfRange
                    signalOn: self
                    mustBeBetween: (-2 raisedTo: 63)
                    and: ((2 raisedTo: 64) - 1)
            ].
            (self > ((2 raisedTo: 32) - 1))
                ifTrue: [CULongLong]
                ifFalse: [
                    (self > ((2 raisedTo: 16) - 1))
                        ifTrue: [CULong]
                        ifFalse: [CUShort]
                ]
        ].
        ^CORBA.ORBitAny withObjectType: klass value: (klass value: self)
    ]
]

Boolean extend [
    asORBitAny [
        ^CORBA.ORBitAny withObjectType: CBoolean value: (CBoolean value: self)
    ]
]

String extend [
    asORBitAny [
        ^CORBA.ORBitAny withObjectType: CString value: (CString value: self)
    ]
]
