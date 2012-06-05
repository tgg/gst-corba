Log subclass: ORBitLog [
    ORBitLog class >> typeId [
        ^'IDL:omg.org/DsLogAdmin/Log:1.0'
    ]

    myFactory [
        self myFactory: self environment
    ]

    myFactory: anEnvironment [
        <cCall: 'DsLogAdmin_Log_my_factory' returning: #{LogMgr} args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    id [
        ^self id: self environment
    ]

    id: anEnvironment [
        <cCall: 'DsLogAdmin_Log_id' returning: #uLong args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    getLogQos [
        | sequence |
        sequence := self getLogQos: self environment.
        ^CORBA.ORBitSequence from: sequence type: CUShort orb: self orb
    ]

    getLogQos: anEnvironment [
        <cCall: 'DsLogAdmin_Log_get_log_qos' returning: #{CORBA.ORBitSequence} args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    setLogQos: aSequence [
        self setLogQos: (aSequence asORBitSequenceOf: CUShort) environment: self environment
    ]

    setLogQos: anORBitSequence environment: anEnvironment [
        <cCall: 'DsLogAdmin_Log_set_log_qos' returning: #void args: #(#self (#ptr #{CORBA.ORBitSequence}) (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    getMaxRecordLife [
        ^self getMaxRecordLife: self environment
    ]

    getMaxRecordLife: anEnvironment [
        <cCall: 'DsLogAdmin_Log_get_max_record_life' returning: #uLong args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    setMaxRecordLife: anUnsignedLong [
        ^self setMaxRecordLife: anUnsignedLong environment: self environment
    ]

    setMaxRecordLife: anUnsignedLong environment: anEnvironment [
        <cCall: 'DsLogAdmin_Log_set_max_record_life' returning: #void args: #(#self #uLong (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    getMaxSize [
        ^self getMaxSize: self environment
    ]

    getMaxSize: anEnvironment [
        <cCall: 'DsLogAdmin_Log_get_max_size' returning: #uLongLong args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    setMaxSize: anUnsignedLongLong [
        ^self setMaxSize: anUnsignedLongLong environment: self environment
    ]

    setMaxSize: anUnsignedLong environment: anEnvironment [
        <cCall: 'DsLogAdmin_Log_set_max_size' returning: #void args: #(#self #uLongLong (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    getCurrentSize [
        ^self getCurrentSize: self environment
    ]

    getCurrentSize: anEnvironment [
        <cCall: 'DsLogAdmin_Log_get_current_size' returning: #uLongLong args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    getNRecords [
        ^self getNRecords: self environment
    ]

    getNRecords: anEnvironment [
        <cCall: 'DsLogAdmin_Log_get_n_records' returning: #uLongLong args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    getLogFullAction [
        ^self getLogFullAction: self environment
    ]

    getLogFullAction: anEnvironment [
        <cCall: 'DsLogAdmin_Log_get_log_full_action' returning: #uShort args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    setLogFullAction: aLogFullAction [
        ^self setLogFullAction: aLogFullAction environment: self environment
    ]

    setLogFullAction: aLogFullAction environment: anEnvironment [
        <cCall: 'DsLogAdmin_Log_set_log_full_action' returning: #void args: #(#self #uShort (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    getAdministrativeState [
        ^AdministrativeState at: (self getAdministrativeState: self environment) + 1
    ]

    getAdministrativeState: anEnvironment [
        <cCall: 'DsLogAdmin_Log_get_administrative_state' returning: #long args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    setAdministrativeState: anAdministrativeState [
        self setAdministrativeState: anAdministrativeState index - 1 environment: self environment
    ]

    setAdministrativeState: anAdministrativeState environment: anEnvironment [
        <cCall: 'DsLogAdmin_Log_set_administrative_state' returning: #void args: #(#self #long (#ptr #{CORBA.ORBitEnvironment}))>
    ]
]

ORBitLog subclass: ORBitBasicLog [
    ORBitBasicLog class >> typeId [
        ^'IDL:omg.org/DsLogAdmin/BasicLog:1.0'
    ]

    destroy [
        self destroy: self environment
    ]

    destroy: anEnvironment [
        <cCall: 'DsLogAdmin_BasicLog_destroy' returning: #void args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
    ]
]

LogMgr subclass: ORBitLogMgr [
    ORBitLogMgr class >> typeId [
        ^'IDL:omg.org/DsLogAdmin/LogMgr:1.0'
    ]

    listLogs [
        | logs |
        logs := self listLogs: self environment.
        ^CORBA.ORBitSequence from: logs type: Log orb: self orb
    ]

    listLogs: anEnvironment [
        <cCall: 'DsLogAdmin_LogMgr_list_logs' returning: #{CORBA.ORBitSequence} args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    findLog: anId [
        | obj |
        obj := self findLog: anId environment: self environment.
        ^self orb bootstrap: obj with: self environment
    ]

    findLog: anInt environment: anEnvironment [
        <cCall: 'DsLogAdmin_LogMgr_find_log' returning: #{ORBitLog} args: #(#self #uLong (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    listLogsById [
        | ids |
        ids := self listLogsById: self environment.
        ^CORBA.ORBitSequence from: ids type: CULong orb: self orb
    ]

    listLogsById: anEnvironment [
        <cCall: 'DsLogAdmin_LogMgr_list_logs_by_id' returning: #{CORBA.ORBitSequence} args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
    ]
]

ORBitLogMgr subclass: ORBitBasicLogFactory [
    ORBitBasicLogFactory class >> typeId [
        ^'IDL:omg.org/DsLogAdmin/BasicLogFactory:1.0'
    ]

    create: aFullAction maxSize: aSize id: anId [
        | obj idPtr corbaObject |
        idPtr := CULongType gcNew.
        obj := self create: aFullAction maxSize: aSize id: idPtr environment: self environment.
        corbaObject := self orb bootstrap: obj with: self environment.
        "store out values; if an exception was thrown we don't reach that point."
        anId value: idPtr value.
        ^corbaObject
    ]

    create: aFullAction maxSize: aSize id: anId environment: anEnvironment [
        <cCall: 'DsLogAdmin_BasicLogFactory_create' returning: #{DsLogAdmin.BasicLog} args: #(#self #uShort #uLongLong (#ptr #uLong) (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    createWithId: anId fullAction: aFullAction maxSize: aSize [
        | obj |
        obj := self createWithId: anId fullAction: aFullAction maxSize: aSize environment: self environment.
        ^self orb bootstrap: obj with: self environment.
    ]

    createWithId: anId fullAction: aFullAction maxSize: aSize environment: anEnvironment [
        <cCall: 'DsLogAdmin_BasicLogFactory_create_with_id' returning: #{DsLogAdmin.BasicLog} args: #(#self #uLong #uShort #uLongLong (#ptr #{CORBA.ORBitEnvironment}))>
    ]
]
