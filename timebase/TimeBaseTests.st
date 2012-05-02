Random extend [
    Random class >> nextShort [
        | lower upper |
        upper := 2 raisedToInteger: 15.
        lower := upper negated.
        upper := upper - 1.
        ^self between: lower and: upper
    ]

    Random class >> nextUnsignedShort [
        | upper |
        upper := (2 raisedToInteger: 16) - 1.
        ^self between: 0 and: upper
    ]

    Random class >> nextLong [
        "| lower upper |
        upper := 2 raisedToInteger: 31.
        lower := upper negated.
        upper := upper - 1.
        ^self between: lower and: upper"
        ^self nextUnsignedShort
    ]

    Random class >> nextUnsignedLong [
        ^self nextLong + (2 raisedToInteger: 31)
    ]

    Random class >> nextUnsignedLongLong [
        "Random works only for 32-bits"
        | lo hi |
        lo := self nextUnsignedLong.
        hi := self nextUnsignedLong.
        ^(hi bitShift: 32) bitOr: lo
    ]
]

TestCase subclass: TimeBaseTest [

    <category: 'CORBA-Tests'>
    <comment: nil>

    testUtcTDefault [
        <category: 'tests'>
        | utc |
        utc := UtcT new.
        self assert: utc notNil.
        self assert: utc time = 0.
        self assert: utc inacclo = 0.
        self assert: utc inacchi = 0.
        self assert: utc tdf = 0
    ]

    testUtcTAccessors [
        <category: 'tests'>
        | utc rnd |
        utc := UtcT new.

        "#time"
        rnd := Random nextUnsignedLongLong.
        utc at: #time put: rnd.
        self assert: (utc at: #time) = rnd.
        self assert: (utc time) = rnd.
        rnd := Random nextUnsignedLongLong.
        utc time: rnd.
        self assert: (utc at: #time) = rnd.
        self assert: (utc time) = rnd.

        "#inacclo"
        rnd := Random nextUnsignedLong.
        utc at: #inacclo put: rnd.
        self assert: (utc at: #inacclo) = rnd.
        self assert: (utc inacclo) = rnd.
        rnd := Random nextUnsignedLong.
        utc inacclo: rnd.
        self assert: (utc at: #inacclo) = rnd.
        self assert: (utc inacclo) = rnd.

        "#inacchi"
        rnd := Random nextUnsignedShort.
        utc at: #inacchi put: rnd.
        self assert: (utc at: #inacchi) = rnd.
        self assert: (utc inacchi) = rnd.
        rnd := Random nextUnsignedShort.
        utc inacchi: rnd.
        self assert: (utc at: #inacchi) = rnd.
        self assert: (utc inacchi) = rnd.

        "#tdf"
        rnd := Random nextShort.
        utc at: #tdf put: rnd.
        self assert: (utc at: #tdf) = rnd.
        self assert: (utc tdf) = rnd.
        rnd := Random nextShort.
        utc tdf: rnd.
        self assert: (utc at: #tdf) = rnd.
        self assert: (utc tdf) = rnd
    ]

    testIntervalTDefault [
        <category: 'tests'>
        | interval |
        interval := IntervalT new.
        self assert: interval notNil.
        self assert: interval lowerBound = 0.
        self assert: interval upperBound = 0
    ]

    testIntervalTAccessors [
        <category: 'tests'>
        | interval rnd |
        interval := IntervalT new.

        "#lowerBound"
        rnd := Random nextUnsignedLongLong.
        interval at: #lowerBound put: rnd.
        self assert: (interval at: #lowerBound) = rnd.
        self assert: (interval lowerBound) = rnd.
        rnd := Random nextUnsignedLongLong.
        interval lowerBound: rnd.
        self assert: (interval at: #lowerBound) = rnd.
        self assert: (interval lowerBound) = rnd.

        "#upperBound"
        rnd := Random nextUnsignedLongLong.
        interval at: #upperBound put: rnd.
        self assert: (interval at: #upperBound) = rnd.
        self assert: (interval upperBound) = rnd.
        rnd := Random nextUnsignedLongLong.
        interval upperBound: rnd.
        self assert: (interval at: #upperBound) = rnd.
        self assert: (interval upperBound) = rnd
    ]
]
