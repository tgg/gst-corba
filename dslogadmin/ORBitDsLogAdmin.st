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

    ORBitTimeInterval class >> value: aTimeInterval [
        ^(self new) value: aTimeInterval
    ]

    value [
        ^(TimeInterval new)
            start: self start value;
            stop: self stop value;
            yourself
    ]

    value: aTimeInterval [
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

    ORBitAvailabilityStatus class >> value: anAvailabilityStatus [
        ^(self new) value: anAvailabilityStatus
    ]

    value [
        ^(AvailabilityStatus new)
            offDuty: self offDuty value;
            logFull: self logFull value;
            yourself
    ]

    value: anAvailabilityStatus [
        self offDuty value: (anAvailabilityStatus at: #offDuty).
        self logFull value: (anAvailabilityStatus at: #logFull)
    ]
]

CStruct subclass: ORBitTime24 [
    <category: 'ORBit'>
    <comment: nil>
    <declaration: #( (#hour #uShort)
                     (#minute #uShort) )>

    ORBitTime24 class >> new [
        ^self fromTypeCode: self typeCode
    ]

    ORBitTime24 class >> fromTypeCode: anAddress [
        <cCall: 'ORBit_small_alloc' returning: #{ORBitTime24} args: #(#cObject)>
    ]

    ORBitTime24 class >> typeCode [
        ^CFunctionDescriptor addressOf: 'TC_DsLogAdmin_Time24_struct'
    ]

    ORBitTime24 class >> value: aTime24 [
        ^(self new) value: aTime24
    ]

    value [
        ^(Time24 new)
            hour: self hour value;
            minute: self minute value;
            yourself
    ]

    value: aTime24 [
        self hour value: (aTime24 at: #hour).
        self minute value: (aTime24 at: #minute)
    ]
]

CStruct subclass: ORBitTime24Interval [
    <category: 'ORBit'>
    <comment: nil>
    <declaration: #( (#start #{ORBitTime24})
                     (#stop #{ORBitTime24}) )>

    ORBitTime24Interval class >> new [
        ^self fromTypeCode: self typeCode
    ]

    ORBitTime24Interval class >> fromTypeCode: anAddress [
        <cCall: 'ORBit_small_alloc' returning: #{ORBitTime24Interval} args: #(#cObject)>
    ]

    ORBitTime24Interval class >> typeCode [
        ^CFunctionDescriptor addressOf: 'TC_DsLogAdmin_Time24Interval_struct'
    ]

    ORBitTime24Interval class >> sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_DsLogAdmin_Time24Interval_struct'
    ]

    ORBitTime24Interval class >> value: aTime24Interval [
        ^(self new) value: aTime24Interval
    ]

    value [
        ^(Time24Interval new)
            start: self start value;
            stop: self stop value;
            yourself
    ]

    value: aTime24Interval [
        self start value: (aTime24Interval at: #start).
        self stop value: (aTime24Interval at: #stop)
    ]
]

CStruct subclass: ORBitWeekMaskItem [
    <category: 'ORBit'>
    <comment: nil>
    <declaration: #( (#days #uShort)
                     (#intervals #{CORBA.ORBitSequence}) )>

    ORBitWeekMaskItem class >> new [
        ^self fromTypeCode: self typeCode
    ]

    ORBitWeekMaskItem class >> fromTypeCode: anAddress [
        <cCall: 'ORBit_small_alloc' returning: #{ORBitWeekMaskItem} args: #(#cObject)>
    ]

    ORBitWeekMaskItem class >> typeCode [
        ^CFunctionDescriptor addressOf: 'TC_DsLogAdmin_WeekMaskItem_struct'
    ]

    ORBitWeekMaskItem class >> sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_DsLogAdmin_WeekMaskItem_struct'
    ]

    ORBitWeekMaskItem class >> value: aWeekMaskItem [
        ^(self new) value: aWeekMaskItem
    ]

    value [
        ^(WeekMaskItem new)
            days: self days value;
            intervals: (self intervals asOrderedCollectionOf: ORBitTime24Interval);
            yourself
    ]

    value: aWeekMaskItem [
        self days value: (aWeekMaskItem at: #days).
        self intervals value: (aWeekMaskItem at: #intervals) type: ORBitTime24Interval.
    ]
]

CStruct subclass: ORBitNVPair [
    <category: 'ORBit'>
    <comment: nil>
    <declaration: #( (#name #string)
                     (#val #{CORBA.ORBitAny}))>

    ORBitNVPair class >> new [
        ^self fromTypeCode: self typeCode
    ]

    ORBitNVPair class >> fromTypeCode: anAddress [
        <cCall: 'ORBit_small_alloc' returning: #{ORBitNVPair} args: #(#cObject)>
    ]

    ORBitNVPair class >> typeCode [
        ^CFunctionDescriptor addressOf: 'TC_DsLogAdmin_NVPair_struct'
    ]

    ORBitNVPair class >> sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_DsLogAdmin_NVPair_struct'
    ]

    ORBitNVPair class >> value: aNVPair [
        ^(self new) value: aNVPair
    ]

    value [
        ^(NVPair new)
            name: self name value;
            value: self val value;
            yourself
    ]

    value: aNVPair [
        self name value: (aNVPair at: #name).
        self val value: (aNVPair at: #value)
    ]
]

CStruct subclass: ORBitLogRecord [
    <category: 'ORBit'>
    <comment: nil>
    <declaration: #( (#id #uLongLong)
                     (#time #uLongLong)
                     (#attrList #{CORBA.ORBitSequence})
                     (#info #{CORBA.ORBitAny}))>

    ORBitLogRecord class >> new [
        ^self fromTypeCode: self typeCode
    ]

    ORBitLogRecord class >> fromTypeCode: anAddress [
        <cCall: 'ORBit_small_alloc' returning: #{ORBitLogRecord} args: #(#cObject)>
    ]

    ORBitLogRecord class >> typeCode [
        ^CFunctionDescriptor addressOf: 'TC_DsLogAdmin_LogRecord_struct'
    ]

    ORBitLogRecord class >> sequenceTypeCode [
        ^CFunctionDescriptor addressOf: 'TC_CORBA_sequence_DsLogAdmin_LogRecord_struct'
    ]

    ORBitLogRecord class >> value: aLogRecord [
        ^(self new) value: aLogRecord
    ]

    value [
        ^(LogRecord new)
            id: self id value;
            time: self time value;
            attrList: (self attrList asOrderedCollectionOf: ORBitNVPair);
            info: self info value;
            yourself
    ]

    value: aLogRecord [
        self id value: (aLogRecord at: #id).
        self time value: (aLogRecord at: #time).
        self attrList value: (aLogRecord at: #attrList) type: ORBitNVPair.
        self info value: (aLogRecord at: #info)
    ]
]

Iterator subclass: ORBitIterator [
    ORBitIterator class >> typeId [
        ^'IDL:omg.org/DsLogAdmin/Iterator:1.0'
    ]

    get: anIndex howMany: aCount [
        | sequence |
        sequence := self get: anIndex howMany: aCount environment: self environment.
        ^CORBA.ORBitSequence from: sequence type: ORBitLogRecord orb: self orb
    ]

    get: anIndex howMany: aCount environment: anEnvironment [
        <cCall: 'DsLogAdmin_Iterator_get' returning: #{CORBA.ORBitSequence} args: #(#self #uLong #uLong (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    destroy [
        self destroy: self environment
    ]

    destroy: anEnvironment [
        <cCall: 'DsLogAdmin_Iterator_destroy' returning: #void args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
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
        self setInterval: (ORBitTimeInterval value: aTimeInterval) environment: self environment
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
        self setCapacityAlarmThresholds: (aSequence asOrderedCollection asORBitSequenceOf: CUShort) environment: self environment
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

    getWeekMask [
        | sequence |
        sequence := self getWeekMask: self environment.
        ^CORBA.ORBitSequence from: sequence type: ORBitWeekMaskItem orb: self orb
    ]

    getWeekMask: anEnvironment [
        <cCall: 'DsLogAdmin_Log_get_week_mask' returning: #{CORBA.ORBitSequence} args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    setWeekMask: aWeekMaskCollection [
        | sequence |
        sequence := aWeekMaskCollection asOrderedCollection asORBitSequenceOf: ORBitWeekMaskItem.
        self setWeekMask: sequence environment: self environment
    ]

    setWeekMask: anORBitWeekMaskItemCollection environment: anEnvironment [
        <cCall: 'DsLogAdmin_Log_set_week_mask' returning: #void args: #(#self (#ptr #{CORBA.ORBitSequence}) (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    query: aString c: aConstraint i: anIterator [
        | sequence iterator |
        iterator := ORBitIterator new.
        sequence := self query: aString c: aConstraint i: iterator environment: self environment.
        iterator isNull ifFalse: [anIterator value: iterator].
        ^self environment raiseOrDo: [
            CORBA.ORBitSequence from: sequence type: ORBitLogRecord orb: self orb
        ]
    ]

    query: aString c: aConstraint i: anIterator environment: anEnvironment [
        <cCall: 'DsLogAdmin_Log_query' returning: #{CORBA.ORBitSequence} args: #(#self #string #string #cObjectPtr (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    retrieve: aTimeT howMany: aLong i: anIterator [
        | sequence iterator |
        iterator := ORBitIterator new.
        sequence := self retrieve: aTimeT howMany: aLong i: iterator environment: self environment.
        iterator isNull ifFalse: [anIterator value: iterator].
        ^self environment raiseOrDo: [
            CORBA.ORBitSequence from: sequence type: ORBitLogRecord orb: self orb
        ]
    ]

    retrieve: aTimeT howMany: aLong i: iterator environment: anEnvironment [
        <cCall: 'DsLogAdmin_Log_retrieve' returning: #{CORBA.ORBitSequence} args: #(#self #uLongLong #long #cObjectPtr (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    match: aString c: aConstraint [
        ^self match: aString c: aConstraint environment: self environment
    ]

    match: aString c: aConstraint environment: anEnvironment [
        <cCall: 'DsLogAdmin_Log_match' returning: #uLong args: #(#self #string #string (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    deleteRecords: aString c: aConstraint [
        ^self deleteRecords: aString c: aConstraint environment: self environment
    ]

    deleteRecords: aString c: aConstraint environment: anEnvironment [
        <cCall: 'DsLogAdmin_Log_delete_records' returning: #uLong args: #(#self #string #string (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    deleteRecordsById: aRecordIdList [
        ^self deleteRecordsById: (aRecordIdList asOrderedCollection asORBitSequenceOf: CULongLong) environment: self environment
    ]

    deleteRecordsById: anORBitSequence environment: anEnvironment [
        <cCall: 'DsLogAdmin_Log_delete_records_by_id' returning: #uLong args: #(#self (#ptr #{CORBA.ORBitSequence}) (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    writeRecords: aAnySequence [
        | orbitSeq |
        orbitSeq := CORBA.ORBitSequence new: aAnySequence size type: CORBA.ORBitAny.
        aAnySequence asOrderedCollection keysAndValuesDo: [:i :e | orbitSeq bufferAt: i - 1 put: e].
        self writeRecords: orbitSeq environment: self environment
    ]

    writeRecords: aAnySequence environment: anEnvironment [
        <cCall: 'DsLogAdmin_Log_write_records' returning: #void args: #(#self (#ptr #{CORBA.ORBitSequence}) (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    writeRecordList: aRecordList [
        | orbitSeq |
        orbitSeq := CORBA.ORBitSequence new: aRecordList size type: ORBitLogRecord.
        aRecordList asOrderedCollection keysAndValuesDo: [:i :e | orbitSeq bufferAt: i - 1 put: e].
        self writeRecordList: orbitSeq environment: self environment.
    ]

    writeRecordList: aSequence environment: anEnvironment [
        <cCall: 'DsLogAdmin_Log_write_recordlist' returning: #void args: #(#self (#ptr #{CORBA.ORBitSequence}) (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    setRecordAttribute: aRecordId attrList: aNVList [
        | orbitSeq |
        orbitSeq := CORBA.ORBitSequence new: aNVList size type: ORBitNVPair.
        aNVList asOrderedCollection keysAndValuesDo: [:i :e | orbitSeq bufferAt: i - 1 put: e].
        self setRecordAttribute: aRecordId attrList: orbitSeq environment: self environment
    ]

    setRecordAttribute: aRecordId attrList: aNVList environment: anEnvironment [
        <cCall: 'DsLogAdmin_Log_set_record_attribute' returning: #void args: #(#self #uLongLong (#ptr #{CORBA.ORBitSequence}) (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    "TODO: setRecordsAttribute"

    getRecordAttribute: aRecordId [
        | sequence |
        sequence := self getRecordAttribute: aRecordId environment: self environment.
        ^self environment raiseOrDo: [
            CORBA.ORBitSequence from: sequence type: ORBitNVPair orb: self orb
        ]
    ]

    getRecordAttribute: aRecordId environment: anEnvironment [
        <cCall: 'DsLogAdmin_Log_get_record_attribute' returning: #{CORBA.ORBitSequence} args: #(#self #uLongLong (#ptr #{CORBA.ORBitEnvironment}))>
    ]

    "TODO: copy"
    "TODO: copyWithId"

    flush [
        self flush: self environment
    ]

    flush: anEnvironment [
        <cCall: 'DsLogAdmin_Log_flush' returning: #void args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
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
