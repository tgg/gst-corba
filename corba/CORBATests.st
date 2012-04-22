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
        self assert: (CORBAConstants at: '::CORBA::UNKNOWN') notNil
    ]

    testCORBAException [
        | e d |
        e := CORBAConstants at: '::CORBA::UNKNOWN'.
        self assert: (e corbaHandle: [:ev | ev] do: [e corbaRaise]) == e.
        self assert: (e corbaHandle: [:ev | ev] do: [nil]) isNil.
        self assert: (e corbaHandle: [:ev | nil] do: [e corbaRaise]) isNil.
        d := Dictionary new.
        d at: #key put: 'value'.
        self assert: (e corbaHandle: [:ev | ev corbaExceptionValue] do: [e corbaRaiseWith: d]) = d.
        self assert: ((e corbaHandle: [:ev | ev corbaExceptionValue] do: [e corbaRaiseWith: d]) at: #key) = 'value'.
    ]
]
