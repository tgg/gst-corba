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
        ^(CORBAParameter new) value: self
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
        ^(CORBANamedValue new) value: self; name: aName; flags: argModeFlags
    ]
]
