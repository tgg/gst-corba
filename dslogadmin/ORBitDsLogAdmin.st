CStruct subclass: ORBitTimeInterval [
    <category: 'ORBit'>
    <comment: nil>
    <declaration: #( (#start #uLongLong)
                     (#stop #uLongLong) )>

    ORBitTimeInterval class >> new [
        ^self fromTypeCode: self typeCode
    ]

    ORBitTimeInterval class >> fromTypeCode: anAddress [
        <cCall: 'ORBit_small_alloc' returning: #{ORBitTimeInterval} args: #(#cObject)>
    ]

    ORBitTimeInterval class >> typeCode [
        ^CFunctionDescriptor addressOf: 'TC_DsLogAdmin_TimeInterval_struct'
    ]

    ORBitTimeInterval class >> from: aTimeInterval [
        ^(self new) with: aTimeInterval
    ]

    asTimeInterval [
        ^(TimeInterval new)
            start: self start value;
            stop: self stop value;
            yourself
    ]

    with: aTimeInterval [
        self start value: (aTimeInterval at: #start).
        self stop value: (aTimeInterval at: #stop)
    ]
]

CStruct subclass: ORBitAvailabilityStatus [
    <category: 'ORBit'>
    <comment: nil>
    <declaration: #( (#offDuty #uChar)
                     (#logFull #uChar) )>

    ORBitAvailabilityStatus class >> new [
        ^self fromTypeCode: self typeCode
    ]

    ORBitAvailabilityStatus class >> fromTypeCode: anAddress [
        <cCall: 'ORBit_small_alloc' returning: #{ORBitAvailabilityStatus} args: #(#cObject)>
    ]

    ORBitAvailabilityStatus class >> typeCode [
        ^CFunctionDescriptor addressOf: 'TC_DsLogAdmin_AvailabilityStatus_struct'
    ]

    ORBitAvailabilityStatus class >> from: anAvailabilityStatus [
        ^(self new) with: anAvailabilityStatus
    ]

    asAvailabilityStatus [
        ^(AvailabilityStatus new)
            offDuty: self offDuty value;
            logFull: self logFull value;
            yourself
    ]

    with: anAvailabilityStatus [
        self offDuty value: (anAvailabilityStatus at: #offDuty).
        self logFull value: (anAvailabilityStatus at: #logFull)
    ]
]

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

    getForwardingState [
        ^ForwardingState at: (self getForwardingState: self environment) + 1
    ]

    getForwardingState: anEnvironment [
        <cCall: 'DsLogAdmin_Log_get_forwarding_state' returning: #long args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    setForwardingState: aForwardingState [
        self setForwardingState: aForwardingState index - 1 environment: self environment
    ]

    setForwardingState: aForwardingState environment: anEnvironment [
        <cCall: 'DsLogAdmin_Log_set_forwarding_state' returning: #void args: #(#self #long (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    getOperationalState [
        ^OperationalState at: (self getOperationalState: self environment) + 1
    ]

    getOperationalState: anEnvironment [
        <cCall: 'DsLogAdmin_Log_get_operational_state' returning: #long args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    getInterval [
        ^(self getInterval: self environment) asTimeInterval
    ]

    getInterval: anEnvironment [
        "TODO: Broken for now because the returned value is not a pointer!"
        <cCall: 'DsLogAdmin_Log_get_interval' returning: #{ORBitTimeInterval} args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    setInterval: aTimeInterval [
        self setInterval: (ORBitTimeInterval from: aTimeInterval) environment: self environment
    ]

    setInterval: anORBitTimeInterval environment: anEnvironment [
        <cCall: 'DsLogAdmin_Log_set_interval' returning: #void args: #(#self (#ptr #{ORBitTimeInterval}) (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    getAvailabilityStatus [
        "TODO: Broken for now because the returned value is not a pointer!"
        ^(self getAvailabilityStatus: self environment) asAvailabilityStatus
    ]

    getAvailabilityStatus: anEnvironment [
        <cCall: 'DsLogAdmin_Log_get_availability_status' returning: #{ORBitAvailabilityStatus} args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    setCapacityAlarmThresholds: aSequence [
        self setCapacityAlarmThresholds: (aSequence asORBitSequenceOf: CUShort) environment: self environment
    ]

    setCapacityAlarmThresholds: aCapacityAlarmThresholdList environment: anEnvironment [
        <cCall: 'DsLogAdmin_Log_set_capacity_alarm_thresholds' returning: #void args: #(#self (#ptr #{CORBA.ORBitSequence}) (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    getCapacityAlarmThresholds [
        | sequence |
        sequence := self getCapacityAlarmThresholds: self environment.
        ^CORBA.ORBitSequence from: sequence type: CUShort orb: self orb
    ]

    getCapacityAlarmThresholds: anEnvironment [
        <cCall: 'DsLogAdmin_Log_get_capacity_alarm_thresholds' returning: #{CORBA.ORBitSequence} args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
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
