Object subclass: CORBAParameter [
    | value |

    <category: 'CORBA'>
    <comment: nil>

    value: anObject [
        value := anObject
    ]

    value [
        ^value
    ]

    asCORBAParameter [
        ^self
    ]
]

Object extend [
    asCORBAParameter [
        ^(CORBA.CORBAParameter new) value: self
    ]
]

Object subclass: CORBANamedValue [
    | name value flags |

    <category: 'CORBA'>
    <comment: nil>

    value: aCORBAObject [
        value := aCORBAObject
    ]

    value [
        ^value
    ]

    name: aString [
        name := aString
    ]

    name [
        ^name
    ]

    flags: argModeFlags [
        flags := argModeFlags
    ]

    flags [
        ^flags
    ]
]

Object extend [
    asCORBANamedValue: aName flags: argModeFlags [
        ^(CORBA.CORBANamedValue new) value: self; name: aName; flags: argModeFlags
    ]
]

Exception subclass: CORBAException [
    CORBAException class >> corbaHandle: aHandlerBlock do: aBlock [
        ^[aBlock value] on: self do: [:sig | aHandlerBlock value: sig]
    ]

    CORBAException class >> corbaRaise [
        self corbaRaiseWith: Dictionary new
    ]

    CORBAException class >> corbaRaiseWith: aDictionary [
        (self new) tag: aDictionary; signal
    ]

    corbaExceptionValue [
        ^self tag
    ]
]

CORBAException subclass: SystemException [
    reason: aString [
        self tag at: #reason put: aString
    ]

    reason [
        ^self tag at: #reason
    ]

    minor: anInteger [
        self tag at: #minor put: anInteger
    ]

    minor [
        ^self tag at: #minor
    ]

    completed: aCompletionStatus [
        self tag at: #completed put: aCompletionStatus
    ]

    completed [
        ^self tag at: #completed
    ]
]

SystemException subclass: UNKNOWN [
]

SystemException subclass: BADPARAM [
]

CORBAException subclass: UserException [
]

"TODO: fix this class so that it does not create a
 new object for every valid #at: invocation"
Object subclass: CORBAEnum [
    | value |

    <category: 'CORBA'>
    <comment: nil>

    CORBAEnum class >> values [
        self subclassResponsibility
    ]

    CORBAEnum class >> at: aString [
        | id |
        id := self values indexOf: aString startingAt: 1.
        id == 0 ifTrue: [SystemExceptions.NotFound signalOn: aString what: 'key'].
        ^self new value: id
    ]

    value: aNumber [
        value := aNumber
    ]

    value [
        ^value
    ]

    < aCORBAEnum [
        ^self class == aCORBAEnum class and: [self value < aCORBAEnum value]
    ]

    <= aCORBAEnum [
        ^self class == aCORBAEnum class and: [self value <= aCORBAEnum value]
    ]

    = aCORBAEnum [
        ^self class == aCORBAEnum class and: [self value = aCORBAEnum value]
    ]

    > aCORBAEnum [
        ^self class == aCORBAEnum class and: [self value > aCORBAEnum value]
    ]

    >= aCORBAEnum [
        ^self class == aCORBAEnum class and: [self value >= aCORBAEnum value]
    ]
]

Object subclass: CORBAORB [
    stringToObject: aString [
        self subclassResponsibility
    ]

    objectToString: aCORBAObject [
        self subclassResponsibility
    ]
]

Object subclass: CORBAMapper [
    CORBAMapper class >> repoIdToCORBAConstantsKey: aString [
        "TODO: should be simpler without regex"
        ^(aString replacingAllRegex: 'IDL:[a-z\.]+\/([A-Z_/]+):[0-9.]+' with: '::%1') replacingAllRegex: '/' with: '::'
    ]
]

Eval [
    "Create the dictionary used for:
       - structs
       - exceptions
       - enums"
    Smalltalk at: #CORBAConstants put: Dictionary new.

    "TODO: complete this with all standard exceptions"
    CORBAConstants at: '::CORBA::UNKNOWN' put: UNKNOWN.
    CORBAConstants at: '::CORBA::BAD_PARAM' put: BADPARAM
]
