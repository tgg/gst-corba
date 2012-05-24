CORBA.ORBitTest subclass: DsLogAdminTest [
    IorPath := '/tmp/basic.ior'.

    | tao ior |

    setUp [
        tao := ThisOSProcess uniqueInstance
            forkAndExec: 'tao_tls_basic' with: {'-x' . '-o' . IorPath}.
        (Delay forSeconds: 2) wait.
        ior := IorPath asFile contents lines at: 1
    ]

    tearDown [
        tao sigKill.
        tao wait
    ]

    testBasicLogFactoryAPI [
        | factory |
        factory := self class stringToObject: ior.
        self assert: (factory isA: 'IDL:omg.org/DsLogAdmin/LogMgr:1.0').
        self assert: (factory respondsTo: #findLog:).
        self assert: (factory respondsTo: #listLogs).
        self assert: (factory respondsTo: #listLogsById).
        self assert: (factory respondsTo: #create:maxSize:id:).
        self assert: (factory respondsTo: #createWithId:fullAction:maxSize:)
    ]

    testBasicLogFactoryCreate [
        | factory id log |
        factory := self class stringToObject: ior.
        id := nil asCORBAParameter.
        log := factory create: 0 maxSize: 0 id: id.
        self assert: id value = 0.
        self assert: (log isA: 'IDL:omg.org/DsLogAdmin/BasicLog:1.0').
        self assert: (((factory listLogs) at: 1) id) = 0.
        self assert: ((factory listLogsById) at: 1) = 0.
        log := factory createWithId: 1 fullAction: 0 maxSize: 0.
        self assert: log id = 1
    ]
]
