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
