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
        self assert: p value == nil
    ]
]
