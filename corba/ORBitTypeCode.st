"TODO this can be written once based on the COBject subclass name"
CUShort class extend [
    sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_CORBA_unsigned_short_struct'
    ]

    typeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_unsigned_short_struct'
    ]
]

CShort class extend [
    sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_CORBA_short_struct'
    ]

    typeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_short_struct'
    ]
]

CULongLong class extend [
    sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_CORBA_unsigned_long_long_struct'
    ]

    typeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_unsigned_long_long_struct'
    ]
]

CLongLong class extend [
    sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_CORBA_long_long_struct'
    ]

    typeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_long_long_struct'
    ]
]

CULong class extend [
    sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_CORBA_unsigned_long_struct'
    ]

    typeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_unsigned_long_struct'
    ]
]

CBoolean class extend [
    sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_CORBA_boolean_struct'
    ]

    typeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_boolean_struct'
    ]
]

CLong class extend [
    sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_CORBA_long_struct'
    ]

    typeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_long_struct'
    ]
]

CString class extend [
    sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_CORBA_string_struct'
    ]

    typeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_string_struct'
    ]
]
