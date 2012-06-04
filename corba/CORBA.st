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
    | index |

    <category: 'CORBA'>
    <comment: nil>

    CORBAEnum class [
        | values |
    ]

    CORBAEnum class >> values [
        self subclassResponsibility
    ]

    CORBAEnum class >> initialize [
        "lazy creation of our values"
        | allValues |
        values ifNil: [
            allValues := self values.
            values := OrderedCollection new: allValues size.
            allValues doWithIndex: [:each :i| values add: (CORBAEnum new index: i)]
        ]
    ]

    CORBAEnum class >> at: aString [
        | id |
        id := self values indexOf: aString.
        id == 0 ifTrue: [SystemExceptions.NotFound signalOn: aString what: 'key'].
        self initialize.
        ^values at: id
    ]

    index: aNumber [
        index := aNumber
    ]

    index [
        ^index
    ]

    < aCORBAEnum [
        ^self class == aCORBAEnum class and: [self index < aCORBAEnum index]
    ]

    <= aCORBAEnum [
        ^self class == aCORBAEnum class and: [self index <= aCORBAEnum index]
    ]

    = aCORBAEnum [
        ^self class == aCORBAEnum class and: [self index = aCORBAEnum index]
    ]

    > aCORBAEnum [
        ^self class == aCORBAEnum class and: [self index > aCORBAEnum index]
    ]

    >= aCORBAEnum [
        ^self class == aCORBAEnum class and: [self index >= aCORBAEnum index]
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
        | stream prefix key next |
        stream := aString readStream.
        prefix := stream next: 4. "IDL:"
        prefix = 'IDL:' ifFalse: [SystemExceptions.InvalidArgument signalOn: aString reason: 'missing prefix'].
        key := WriteStream on: (String new: aString size - 4).
        key nextPutAll: '::'.
        stream skipTo: $/.
        [stream atEnd or: [(next := stream next) == $:]]
            whileFalse: [
                next == $/
                    ifFalse: [key nextPut: next]
                    ifTrue: [key nextPutAll: '::']
            ].
        ^key contents
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
