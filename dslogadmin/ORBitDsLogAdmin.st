Log subclass: ORBitLog [
    ORBitLog class >> typeId [
        ^'IDL:omg.org/DsLogAdmin/Log:1.0'
    ]

    id [
        ^self id: self environment
    ]

    id: anEnvironment [
        <cCall: 'DsLogAdmin_Log_id' returning: #uLong args: #(#self (#ptr #{CORBA.ORBitEnvironment}))>
    ]
]

ORBitLog subclass: ORBitBasicLog [
    ORBitBasicLog class >> typeId [
        ^'IDL:omg.org/DsLogAdmin/BasicLog:1.0'
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
