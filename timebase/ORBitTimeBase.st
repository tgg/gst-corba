CStruct subclass: ORBitUtcT [
    <declaration: #( (#time #uLongLong)
                     (#inacclo #uLong)
                     (#inacchi #uShort)
                     (#tdf #short) )>

    ORBitUtcT class >> new [
        ^self fromTypeCode: self typeCode
    ]

    ORBitUtcT class >> fromTypeCode: anAddress [
        <cCall: 'ORBit_small_alloc' returning: #{ORBitUtcT} args: #(#cObject)>
    ]

    ORBitUtcT class >> typeCode [
        ^CFunctionDescriptor addressOf: 'TC_TimeBase_UtcT_struct'
    ]

    ORBitUtcT class >> from: aUtcT [
        ^(self new) value: aUtcT
    ]

    value [
        ^(UtcT new)
            time: self time value;
            inacclo: self inacclo value;
            inacchi: self inacchi value;
            tdf: self tdf value;
            yourself
    ]

    value: aUtcT [
        self time value: (aUtcT at: #time).
        self inacclo value: (aUtcT at: #inacclo).
        self inacchi value: (aUtcT at: #inacchi).
        self tdf value: (aUtcT at: #tdf)
    ]
]

CStruct subclass: ORBitIntervalT [
    <declaration: #( (#lowerBound #uLongLong)
                     (#upperBound #uLongLong) )>

    ORBitIntervalT class >> new [
        ^self fromTypeCode: self typeCode
    ]

    ORBitIntervalT class >> fromTypeCode: anAddress [
        <cCall: 'ORBit_small_alloc' returning: #{ORBitIntervalT} args: #(#cObject)>
    ]

    ORBitIntervalT class >> typeCode [
        ^CFunctionDescriptor addressOf: 'TC_TimeBase_IntervalT_struct'
    ]

    ORBitIntervalT class >> from: anIntervalT [
        ^(self new) value: anIntervalT
    ]

    value [
        ^(IntervalT new)
            lowerBound: self lowerBound value;
            upperBound: self upperBound value;
            yourself
    ]

    value: anIntervalT [
        self lowerBound value: (anIntervalT at: #lowerBound).
        self upperBound value: (anIntervalT at: #upperBound)
    ]
]
