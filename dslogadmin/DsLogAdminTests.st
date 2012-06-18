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
        | factory id log e |
        factory := self class stringToObject: ior.
        id := nil asCORBAParameter.
        log := factory create: 0 maxSize: 0 id: id.
        self assert: id value = 0.
        self assert: (log isA: 'IDL:omg.org/DsLogAdmin/BasicLog:1.0').
        self assert: (((factory listLogs) at: 1) id) = 0.
        self assert: ((factory listLogsById) at: 1) = 0.
        log := factory createWithId: 1 fullAction: 0 maxSize: 0.
        self assert: log id = 1.
        (CORBAConstants at: '::DsLogAdmin::LogIdAlreadyExists') corbaHandle: [:ev | e := ev] do: [factory createWithId: 1 fullAction: 0 maxSize: 0].
        self assert: e notNil.
    ]

    testLogAPI [
        | factory log |
        factory := self class stringToObject: ior.
        log := factory create: 0 maxSize: 0 id: (nil asCORBAParameter).
        self assert: (log respondsTo: #myFactory).
        self assert: (log respondsTo: #id).
        self assert: (log respondsTo: #getLogQos).
        self assert: (log respondsTo: #setLogQos:).
        self assert: (log respondsTo: #getMaxRecordLife).
        self assert: (log respondsTo: #setMaxRecordLife:).
        self assert: (log respondsTo: #getMaxSize).
        self assert: (log respondsTo: #setMaxSize:).
        self assert: (log respondsTo: #getCurrentSize).
        self assert: (log respondsTo: #getNRecords).
        self assert: (log respondsTo: #getLogFullAction).
        self assert: (log respondsTo: #setLogFullAction:).
    ]

    testLog [
        | factory log qos halt locked on interval |
        factory := self class stringToObject: ior.
        log := factory create: 0 maxSize: 0 id: (nil asCORBAParameter).
        self assert: log myFactory notNil.
        self assert: log id = 0.
        qos := CORBAConstants at: '::DsLogAdmin::QoSFlush'.
        log setLogQos: (OrderedCollection with: qos).
        self assert: log getLogQos = (OrderedCollection with: qos).
        log setMaxRecordLife: 15.
        self assert: log getMaxRecordLife = 15.
        log setMaxSize: 10.
        self assert: log getMaxSize = 10.
        self assert: log getCurrentSize = 0.
        self assert: log getNRecords = 0.
        halt := CORBAConstants at: '::DsLogAdmin::halt'.
        log setLogFullAction: halt.
        self assert: log getLogFullAction = halt.
        locked := CORBAConstants at: '::DsLogAdmin::locked'.
        log setAdministrativeState: locked.
        self assert: log getAdministrativeState = locked.
        on := CORBAConstants at: '::DsLogAdmin::on'.
        log setForwardingState: on.
        self assert: log getForwardingState = on.
        self assert: log getOperationalState = (CORBAConstants at: '::DsLogAdmin::enabled').
        interval := (TimeInterval new) stop: 15; yourself.
        log setInterval: interval.
        "self assert: log getInterval = interval" "Broken for now"
        log setCapacityAlarmThresholds:  #(50 75) asOrderedCollection.
        self assert: log getCapacityAlarmThresholds = #(50 75) asOrderedCollection.
        "self assert: log getAvailabilityStatus = AvailabilityStatus new" "Broken for now"
        log writeRecords: #('First record' 'second record') asOrderedCollection
    ]
]
