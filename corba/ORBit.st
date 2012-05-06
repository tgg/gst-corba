CStruct subclass: ORBitAny [
    <category: 'ORBit'>
    <comment: nil>
    <declaration: #( (#type #(#ptr #CObject))
                     (#value #(#ptr #CObject))
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
    <declaration: #( (#id #(#ptr #char))
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

    ifNoException: aBlock [
        ^self major value = 0 ifTrue: [aBlock value] ifFalse: [self raise]
    ]
]

CObject subclass: ORBitObject [
    | environment |

    environment [        
        environment ifNil: [environment := ORBitEnvironment new].
        ^environment
    ]

    isA: aString [
        | r |
        r := self isA: aString environment: self environment.
        ^self environment ifNoException: [r ~= $0]
    ]

    isA: aString environment: anEnvironment [
        <cCall: 'CORBA_Object_is_a' returning: #uChar args: #(#self #string (#ptr #{ORBitEnvironment}))>
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

    orb: aCObject [
        orb := aCObject
    ]

    environment: anEnvironment [
        environment := anEnvironment
    ]

    id: aString [
        id := aString
    ]

    stringToObject: aString [
        | obj |
        ^aString
          ifNotNil: [
              obj := self class stringToObject: orb string: aString environment: environment.
              environment ifNoException: [obj]
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
