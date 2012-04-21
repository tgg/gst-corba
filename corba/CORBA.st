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
