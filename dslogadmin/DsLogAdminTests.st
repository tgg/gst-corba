CORBA.ORBitTest subclass: DsLogAdminTest [
    IorPath := '/tmp/basic.ior'.

    | tao ior |

    setUp [
        tao := ThisOSProcess uniqueInstance
            forkAndExec: 'tao_tls_basic' with: {'-x' . '-o' . IorPath}.
        ior := IorPath asFile contents lines at: 1
    ]

    tearDown [
        tao sigKill.
        tao wait.
    ]

    testBasicLogFactory [
        | factory |
        factory := self class stringToObject: ior.
        self assert: (factory respondsTo: #findLog:)
    ]
]
