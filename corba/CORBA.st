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
    corbaHandle: aHandlerBlock do: aBlock [
        ^[aBlock value] on: self class do: [:sig | aHandlerBlock value: sig]
    ]

    corbaRaise [
        self corbaRaiseWith: Dictionary new
    ]

    corbaRaiseWith: aDictionary [
        (self class new) tag: aDictionary; signal
    ]

    corbaExceptionValue [
        ^self tag
    ]
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

Eval [
    "Create the dictionary used for:
       - structs
       - exceptions
       - enums"
    Smalltalk at: #CORBAConstants put: Dictionary new.

    "TODO: complete this with all standard exceptions"
    CORBAConstants at: '::CORBA::UNKNOWN' put: CORBAException new
]
