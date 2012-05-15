Log subclass: ORBitLog [
    ORBitLog class >> typeId [
        ^'IDL:omg.org/DsLogAdmin/Log:1.0'
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

    findLog: anId [
        | obj |
        obj := self findLog: anId environment: self environment.
        ^self orb bootstrap: obj with: self environment
    ]

    findLog: anInt environment: anEnvironment [
        <cCall: 'DsLogAdmin_LogMgr_find_log' returning: #{ORBitLog} args: #(#self #uLong (#ptr #{ORBitEnvironment}))>
    ]

    listLogsById [
        | ids |
        ids := self listLogsById: self environment.
        ids bufferType: CULongLong type.
        ^ids asOrderedCollection
    ]

    listLogsById: anEnvironment [
        <cCall: 'DsLogAdmin_LogMgr_list_logs_by_id' returning: #{CORBA.ORBitSequence} args: #(#self (#ptr #{ORBitEnvironment}))>
    ]
]

ORBitLogMgr subclass: ORBitBasicLogFactory [
    ORBitBasicLogFactory class >> typeId [
        ^'IDL:omg.org/DsLogAdmin/BasicLogFactory:1.0'
    ]
]
