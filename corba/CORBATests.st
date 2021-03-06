CORBAEnum subclass: ChartStyle [
    ChartStyle class >> values [
        ^#('::Graphics::lineChart'
           '::Graphics::barChart'
           '::Graphics::stackedBarChart'
           '::Graphics::pieChart')
    ]
]

Eval [
    ChartStyle initialize
]

TestCase subclass: CORBATest [

    <category: 'CORBA-Tests'>
    <comment: nil>

    testAsCORBAParameter [
        <category: 'tests'>
        | o p |
        o := Object new.
        p := o asCORBAParameter.
        self assert: p value == o.
        self assert: p asCORBAParameter == p.
        p value: nil.
        self assert: p value isNil.
        self assert: (nil asCORBAParameter) notNil
    ]

    testAsCORBANamedValue [
        <category: 'tests'>
        | o n |
        o := Object new.
        n := o asCORBANamedValue: 'aName' flags: 2.
        self assert: n name = 'aName'.
        n name: nil.
        self assert: n name isNil.
        self assert: n value == o.
        n value: Object new.
        self assert: (n value == o) not.
        self assert: n flags == 2.
        n flags: 0.
        self assert: n flags = 0
    ]

    testCORBASystemException [
        self assert: (CORBAConstants at: '::CORBA::UNKNOWN') notNil.
        self assert: (CORBAConstants at: '::CORBA::BAD_PARAM') notNil
    ]

    testCORBAException [
        | e d |
        e := CORBAConstants at: '::CORBA::UNKNOWN'.
        self assert: (e corbaHandle: [:ev | ev] do: [e corbaRaise]) notNil.
        self assert: (e corbaHandle: [:ev | ev] do: [e corbaRaise]) class == e.
        self assert: (e corbaHandle: [:ev | ev] do: [nil]) isNil.
        self assert: (e corbaHandle: [:ev | nil] do: [e corbaRaise]) isNil.
        d := Dictionary new.
        d at: #key put: 'value'.
        self assert: (e corbaHandle: [:ev | ev corbaExceptionValue] do: [e corbaRaiseWith: d]) = d.
        self assert: ((e corbaHandle: [:ev | ev corbaExceptionValue] do: [e corbaRaiseWith: d]) at: #key) = 'value'.
        self assert: (e corbaHandle: [:ev | ev corbaExceptionValue] do: [e corbaRaise]) isEmpty
    ]

    testCORBAEnum [
        | v1 v2 v3 |
        v1 := CORBAConstants at: '::Graphics::lineChart'.
        self assert: v1 index = 1.
        v2 := CORBAConstants at: '::Graphics::pieChart'.
        self assert: v2 > v1.
        self assert: v2 >= v1.
        self assert: v1 < v2.
        self assert: v1 <= v2.
        v3 := CORBAConstants at: '::Graphics::pieChart'.
        self assert: v2 == v3.
    ]

    testNameMapping [
        self assert: (CORBAMapper repoIdToCORBAConstantsKey: 'IDL:omg.org/CORBA/BAD_PARAM:1.0') = '::CORBA::BAD_PARAM'.
        self assert: (CORBAMapper repoIdToCORBAConstantsKey: 'IDL:omg.org/DsLogAdmin/LogIdAlreadyExists:1.0') = '::DsLogAdmin::LogIdAlreadyExists'.
        self should: [CORBAMapper repoIdToCORBAConstantsKey: 'invalid repo id'] raise: SystemExceptions.InvalidArgument
    ]
]
