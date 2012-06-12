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

CULong class extend [
    sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_CORBA_unsigned_long_struct'
    ]

    typeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_unsigned_long_struct'
    ]
]
