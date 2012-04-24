CStruct subclass: ORBitUtcT [
    <declaration: #( (#time #uLongLong)
                     (#inacclo #uLong)
                     (#inacchi #uShort)
                     (#tdf #short) )>

    ORBitUtcT class >> new: anAddress [
        <cCall: 'ORBit_small_alloc' returning: #{ORBitUtcT} args: #(#cObject)>
    ]

    ORBitUtcT class >> structAddress [
        ^CFunctionDescriptor addressOf: 'TC_TimeBase_UtcT_struct'
    ]

    ORBitUtcT class >> from: aUtcT [
        ^(self new: self structAddress) value: aUtcT
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
