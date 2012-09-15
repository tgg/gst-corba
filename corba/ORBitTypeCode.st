"TODO this can be written once based on the COBject subclass name"
CUShort class extend [
    sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_CORBA_unsigned_short_struct'
    ]

    typeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_unsigned_short_struct'
    ]

    tcKind [
        ^4
    ]
]

CShort class extend [
    sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_CORBA_short_struct'
    ]

    typeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_short_struct'
    ]

    tcKind [
        ^2
    ]
]

CULongLong class extend [
    sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_CORBA_unsigned_long_long_struct'
    ]

    typeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_unsigned_long_long_struct'
    ]

    tcKind [
        ^24
    ]
]

CLongLong class extend [
    sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_CORBA_long_long_struct'
    ]

    typeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_long_long_struct'
    ]

    tcKind [
        ^23
    ]
]

CULong class extend [
    sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_CORBA_unsigned_long_struct'
    ]

    typeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_unsigned_long_struct'
    ]

    tcKind [
        ^5
    ]
]

CBoolean class extend [
    sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_CORBA_boolean_struct'
    ]

    typeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_boolean_struct'
    ]

    tcKind [
        ^8
    ]
]

CLong class extend [
    sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_CORBA_long_struct'
    ]

    typeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_long_struct'
    ]

    tcKind [
        ^3
    ]
]

CString class extend [
    sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_CORBA_string_struct'
    ]

    typeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_string_struct'
    ]

    tcKind [
        ^18
    ]
]
