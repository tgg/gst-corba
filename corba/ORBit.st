CStruct subclass: ORBitAny [
    <category: 'ORBit'>
    <comment: nil>
    <declaration: #( (#type (#ptr #CObject))
                     (#value (#ptr #CObject))
                     (#release #uChar) )>

    ORBitAny class >> new [
        <cCall: 'CORBA_any__alloc' returning: #{ORBitAny} args: #(#void)>
    ]

    free [
        <cCall: 'CORBA_free' returning: #void args: #(#self)>
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

CPtr subclass: ORBitObject [
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
                     (#buffer (#ptr #{CArray}))
                     (#release #uChar) )>

    | bufferType |

    ORBitSequence class >> new: anInteger type: aCObjectType [
        | sequence buffer |
        sequence := self allocSeq: aCObjectType sequenceTypeCode.
        sequence length value: anInteger.
        sequence maximum value: anInteger.
        "Always free the sequence on #free"
        sequence release value: $1.
        buffer := self allocBuf: aCObjectType sequenceTypeCode size: anInteger.
        sequence bufferType: aCObjectType.
        sequence buffer value: buffer.
        ^sequence
    ]

    bufferType: aCObjectType [
        bufferType := aCObjectType
    ]

    at: byteOffset type: aType [
        "We override this because buffer underlying array type is known late.
         This fixes ORBitSequence>>#buffer using bufferType"
        ^(bufferType notNil and: [byteOffset = 8])
            ifFalse: [super at: byteOffset type: aType]
            ifTrue: [super at: byteOffset type: (CPtrCType elementType: (bufferType type arrayType: self length value))]
    ]

    ORBitSequence class >> allocSeq: aTypeCodeAddress [
        <cCall: 'ORBit_small_alloc' returning: #{ORBitSequence} args: #(#cObject)>
    ]

    ORBitSequence class >> allocBuf: aTypeCodeAddress size: anInteger [
        <cCall: 'ORBit_small_allocbuf' returning: #cObject args: #(#cObject #uLong)>
    ]

    free [
        <cCall: 'CORBA_free' returning: #void args: #(#self)>
    ]

    asOrderedCollection [
        ^self asOrderedCollectionDo: [:e | e]
    ]

    asOrderedCollectionDo: aBlock [
        | col len i |
        len := self length value.
        col := OrderedCollection new: len.
        i := 0.
        [i < len] whileTrue: [ col add: (aBlock value: (self buffer value at: i)). i := i + 1].
        ^col
    ]

    ORBitSequence class >> from: anORBitSequence type: aCObjectType orb: anORBitORB [
        anORBitSequence bufferType: aCObjectType.
        ^(aCObjectType isKindOf: CORBA.ORBitObject)
            ifFalse: [anORBitSequence asOrderedCollection]
            ifTrue: [anORBitSequence asOrderedCollectionDo: [:e | anORBitORB bootstrap: e]]
    ]
]

OrderedCollection extend [
    asORBitSequenceOf: aCObjectType [
        | sequence i |
        sequence := CORBA.ORBitSequence new: self size type: aCObjectType.
        i := 0.
        self do: [ :e | sequence buffer value at: i put: e. i := i + 1].
        ^sequence
    ]
]
