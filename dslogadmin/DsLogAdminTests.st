CORBA.ORBitTest subclass: DsLogAdminTest [
    testBasicLogFactory [
        | factory |
        factory := self class logManager.
        self assert: (factory respondsTo: #findLog:)
    ]
]
