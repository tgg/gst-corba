CORBA.ORBitTest subclass: DsLogAdminTest [
    IorPath := '/tmp/basic.ior'.

    | tao ior weekMask |

    setUp [
        | timeInterval start stop weekMaskItem |
        tao := ThisOSProcess uniqueInstance
            forkAndExec: 'tao_tls_basic' with: {'-x' . '-o' . IorPath}.
        (Delay forSeconds: 2) wait.
        ior := IorPath asFile contents lines at: 1.
        start := DsLogAdmin.Time24 new.
        start hour: 8; minute: 0.
        stop := DsLogAdmin.Time24 new.
        stop hour: 23; minute: 50.
        timeInterval := DsLogAdmin.Time24Interval new.
        timeInterval start: start; stop: stop.
        weekMaskItem := DsLogAdmin.WeekMaskItem new.
        weekMaskItem days: (CORBAConstants at: '::DsLogAdmin::Sunday').
        weekMaskItem intervals: (OrderedCollection with: timeInterval).
        weekMask := OrderedCollection with: weekMaskItem
    ]

    tearDown [
        tao sigKill.
        tao wait
    ]

    testBasicLogFactoryAPI [
        | factory |
        factory := self class stringToObject: ior.
        self assert: (factory isA: 'IDL:omg.org/DsLogAdmin/LogMgr:1.0')
    ]

    testBasicLogFactoryCreate [
        | factory id log e |
        factory := self class stringToObject: ior.
        id := nil asCORBAParameter.
        log := factory create: 0 maxSize: 0 id: id.
        self assert: id value = 0.
        self assert: (log isA: 'IDL:omg.org/DsLogAdmin/BasicLog:1.0').
        self assert: ((factory listLogs at: 1) id) = 0.
        self assert: (factory listLogsById at: 1) = 0.
        log := factory createWithId: 1 fullAction: 0 maxSize: 0.
        self assert: log id = 1.
        (CORBAConstants at: '::DsLogAdmin::LogIdAlreadyExists') corbaHandle: [:ev | e := ev] do: [factory createWithId: 1 fullAction: 0 maxSize: 0].
        self assert: e notNil.
    ]

    testLog [
        | factory log qos halt locked on |
        factory := self class stringToObject: ior.
        log := factory create: 0 maxSize: 0 id: (nil asCORBAParameter).
        self assert: log myFactory notNil.
        self assert: log id = 0.
        qos := CORBAConstants at: '::DsLogAdmin::QoSFlush'.
        log setLogQos: (OrderedCollection with: qos).
        self assert: log getLogQos = (OrderedCollection with: qos).
        log setMaxRecordLife: 30 * 60.
        self assert: log getMaxRecordLife = (30 * 60).
        log setMaxSize: 5 * 1024 * 1024.
        self assert: log getMaxSize = (5 * 1024 * 1024).
        self assert: log getCurrentSize = 0.
        self assert: log getNRecords = 0.
        halt := CORBAConstants at: '::DsLogAdmin::halt'.
        log setLogFullAction: halt.
        self assert: log getLogFullAction = halt.
        locked := CORBAConstants at: '::DsLogAdmin::locked'.
        log setAdministrativeState: locked.
        self assert: log getAdministrativeState = locked.
        "Unlock so that we can still use it"
        log setAdministrativeState: (CORBAConstants at: '::DsLogAdmin::unlocked').
        on := CORBAConstants at: '::DsLogAdmin::on'.
        log setForwardingState: on.
        self assert: log getForwardingState = on.
        self assert: log getOperationalState = (CORBAConstants at: '::DsLogAdmin::enabled').
        " interval := (TimeInterval new) stop: 15; yourself. "
        " log setInterval: interval. "
        " self assert: log getInterval = interval!" "Broken for now! "
        log setCapacityAlarmThresholds:  #(50 75).
        self assert: log getCapacityAlarmThresholds = #(50 75) asOrderedCollection.
        "self assert: log getAvailabilityStatus = AvailabilityStatus new" "Broken for now"
        self shouldnt: [log writeRecords: #('First record' 'second record' 'third')] raise: Exception.
        self shouldnt: [log flush] raise: Exception.
        self assert: (log match: 'EXTENDED_TCL' c: '$.info ~= ''record''') = 2.
        self assert: (log deleteRecords: 'EXTENDED_TCL' c: '$.id == 1') = 1.
        self assert: (log deleteRecordsById: #(2)) = 1.
        log setWeekMask: weekMask.
        self assert: log getWeekMask = weekMask.
        self assert: ((log query: 'EXTENDED_TCL' c: '' i: (nil asCORBAParameter)) at: 1) info = 'third'.
        log destroy
    ]

    testComplexAsORBitSequence [
        |  orbitSeq |
        orbitSeq := weekMask asORBitSequenceOf: ORBitWeekMaskItem.
        self assert: orbitSeq asOrderedCollection = weekMask
    ]
]
