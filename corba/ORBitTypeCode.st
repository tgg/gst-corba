CULongLong extend [
    CULongLong class >> sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_CORBA_unsigned_long_long_struct'
    ]

    CULongLong class >> typeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_unsigned_long_long_struct'
    ]
]
