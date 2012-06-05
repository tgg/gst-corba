"======================================================================
|
|   Hand-written stub file
|
 ======================================================================"

CORBA.UserException subclass: InvalidParam [
    details [
        ^self tag at: #details
    ]

    details: aString [
        self tag at: #details put: aString
    ]
]

CORBA.UserException subclass: InvalidThreshold [
]

CORBA.UserException subclass: InvalidTime [
]

CORBA.UserException subclass: InvalidTimeInterval [
]

CORBA.UserException subclass: InvalidMask [
]

CORBA.UserException subclass: LogIdAlreadyExists [
]

CORBA.UserException subclass: InvalidGrammar [
]

CORBA.UserException subclass: InvalidConstraint [
]

CORBA.UserException subclass: LogFull [
    nRecordsWritten [
        ^self tag at: #nRecordsWritten
    ]

    nRecordsWritten: aShort [
        self tag at: #nRecordsWritten put: aShort
    ]
]

CORBA.UserException subclass: LogOffDuty [
]

CORBA.UserException subclass: LogLocked [
]

CORBA.UserException subclass: LogDisabled [
]

CORBA.UserException subclass: InvalidRecordId [
]

CORBA.UserException subclass: InvalidAttribute [
    attrName [
        ^self tag at: #attrName
    ]

    attrName: aString [
        self tag at: #attrName put: aString
    ]

    value [
        ^self tag at: #value
    ]

    value: anAny [
        self at: #value put: anAny
    ]
]

CORBA.UserException subclass: InvalidLogFullAction [
]

Eval [
    CORBAConstants at: '::DsLogAdmin::InvalidParam' put: InvalidParam.
    CORBAConstants at: '::DsLogAdmin::InvalidThreshold' put: InvalidThreshold.
    CORBAConstants at: '::DsLogAdmin::InvalidTime' put: InvalidTime.
    CORBAConstants at: '::DsLogAdmin::InvalidTimeInterval' put: InvalidTimeInterval.
    CORBAConstants at: '::DsLogAdmin::InvalidMask' put: InvalidMask.
    CORBAConstants at: '::DsLogAdmin::LogIdAlreadyExists' put: LogIdAlreadyExists.
    CORBAConstants at: '::DsLogAdmin::InvalidGrammar' put: InvalidGrammar.
    CORBAConstants at: '::DsLogAdmin::InvalidConstraint' put: InvalidConstraint.
    CORBAConstants at: '::DsLogAdmin::LogFull' put: LogFull.
    CORBAConstants at: '::DsLogAdmin::LogOffDuty' put: LogOffDuty.
    CORBAConstants at: '::DsLogAdmin::LogLocked' put: LogLocked.
    CORBAConstants at: '::DsLogAdmin::LogDisabled' put: LogDisabled.
    CORBAConstants at: '::DsLogAdmin::InvalidRecordId' put: InvalidRecordId.
    CORBAConstants at: '::DsLogAdmin::InvalidAttribute' put: InvalidAttribute.
    CORBAConstants at: '::DsLogAdmin::InvalidLogFullAction' put: InvalidLogFullAction.

    CORBAConstants at: '::DsLogAdmin::default_grammar' put: 'EXTENDED_TCL'.
]

Dictionary subclass: NVPair [
    <shape: #pointer>

    NVPair class >> new [
	<category: 'instance creation'>
        ^self from: {#name -> nil . #value -> nil}
    ]

    name: aString [
        self at: #name put: aString
    ]

    name [
        ^self at: #name
    ]

    value: anAny [
        self at: #value put: anAny
    ]

    value [
        ^self at: #value
    ]
]

Dictionary subclass: TimeInterval [
    <shape: #pointer>

    TimeInterval class >> new [
	<category: 'instance creation'>
        ^self from: {#start -> 0 . #stop -> 0}
    ]

    start: aTimeT [
        self at: #start put: aTimeT
    ]

    start [
        ^self at: #start
    ]

    stop: aTimeT [
        self at: #stop put: aTimeT
    ]

    stop [
        ^self at: #stop
    ]
]

Dictionary subclass: LogRecord [
    <shape: #pointer>

    LogRecord class >> new [
	<category: 'instance creation'>
        ^self from: {#id -> 0 . #time -> 0 . #attrList -> nil . #info -> nil}
    ]

    id: anUnsignedLongLong [
        self at: #id put: anUnsignedLongLong
    ]

    id [
        ^self at: #id
    ]

    time: aTimeT [
        self at: #time put: aTimeT
    ]

    time [
        ^self at: #time
    ]

    attrList: aNVList [
        "attributes, optional"
        self at: #attrList put: aNVList
    ]

    attrList [
        "attributes, optional"
        ^self at: #attrList
    ]

    info: anAny [
        self at: #info put: anAny
    ]

    info [
        ^self at: #info
    ]
]

CORBA.ORBitObject subclass: Iterator [
    <comment: 'Iterator with bulk operation support; returned as a
result of querying the Log'>
    get: anIndex howMany: aCount [
        self subclassResponsibility
    ]

    destroy [
        self subclassResponsibility
    ]
]

Dictionary subclass: AvailabilityStatus [
    <shape: #pointer>

    AvailabilityStatus class >> new [
	<category: 'instance creation'>
        ^self from: {#offDuty -> false . #logFull -> false}
    ]

    offDuty: aBoolean [
        self at: #offDuty put: aBoolean
    ]

    offDuty [
        ^self at: #offDuty
    ]

    logFull: aBoolean [
        self at: #logFull put: aBoolean
    ]

    logFull [
        ^self at: #logFull
    ]
]

Eval [
    CORBAConstants at: '::DsLogAdmin::wrap' put: 0.
    CORBAConstants at: '::DsLogAdmin::halt' put: 1.
]

Dictionary subclass: Time24 [
    <shape: #pointer>

    Time24 class >> new [
	<category: 'instance creation'>
        ^self from: {#hour -> 0 . #minute -> 0}
    ]

    hour: anUnsignedShort [
        "0-23"
        self at: #hour put: anUnsignedShort
    ]

    hour [
        "0-23"
        ^self at: #hour
    ]

    minute: anUnsignedShort [
        "0-59"
        self at: #minute put: anUnsignedShort
    ]

    minute [
        "0-59"
        ^self at: #minute
    ]
]

Dictionary subclass: Time24Interval [
    <shape: #pointer>

    Time24Interval class >> new [
	<category: 'instance creation'>
        ^self from: {#start -> nil . #stop -> nil}
    ]

    start: aTime24 [
        self at: #start put: aTime24
    ]

    start [
        ^self at: #start
    ]

    stop: aTime24 [
        self at: #stop put: aTime24
    ]

    stop [
        ^self at: #stop
    ]
]

Eval [
    CORBAConstants at: '::DsLogAdmin::Sunday' put: 1.
    CORBAConstants at: '::DsLogAdmin::Monday' put: 2.
    CORBAConstants at: '::DsLogAdmin::Tuesday' put: 4.
    CORBAConstants at: '::DsLogAdmin::Wednesday' put: 8.
    CORBAConstants at: '::DsLogAdmin::Thursday' put: 16.
    CORBAConstants at: '::DsLogAdmin::Friday' put: 32.
    CORBAConstants at: '::DsLogAdmin::Saturday' put: 64.
]

Dictionary subclass: WeekMaskItem [
    <shape: #pointer>

    WeekMaskItem class >> new [
	<category: 'instance creation'>
        ^self from: {#days -> 0 . #intervals -> nil}
    ]

    days: aDaysOfWeek [
        self at: #days put: aDaysOfWeek
    ]

    days [
        ^self at: #days
    ]

    intervals: anIntervalOfDay [
        self at: #intervals put: anIntervalOfDay
    ]

    intervals [
        ^self at: #intervals
    ]
]

CORBA.CORBAEnum subclass: OperationalState [
    OperationalState class >> values [
        ^#('::DsLogAdmin::disabled' '::DsLogAdmin::enabled')
    ]
]

Eval [
    OperationalState initialize
]

CORBA.CORBAEnum subclass: AdministrativeState [
    <comment: 'logging on/off'>
    AdministrativeState class >> values [
        ^#('::DsLogAdmin::locked' '::DsLogAdmin::unlocked')
    ]
]

Eval [
    AdministrativeState initialize
]

CORBA.CORBAEnum subclass: ForwardingState [
    ForwardingState class >> values [
        ^#('::DsLogAdmin::on' '::DsLogAdmin::off')
    ]
]

Eval [
    ForwardingState initialize
]

CORBA.UserException subclass: UnsupportedQoS [
    denied [
        ^self tag at: #denied
    ]

    denied: aQoSList [
        self tag at: #denied put: aQoSList
    ]
]

Eval [
    CORBAConstants at: '::DsLogAdmin::UnsupportedQoS' put: UnsupportedQoS.
    CORBAConstants at: '::DsLogAdmin::QoSNone' put: 0.
    CORBAConstants at: '::DsLogAdmin::QoSFlush' put: 1.
    CORBAConstants at: '::DsLogAdmin::QoSReliability' put: 2
]

CORBA.ORBitObject subclass: Log [
    myFactory [
        self subclassResponsibility
    ]

    id [
        self subclassResponsibility
    ]

    getLogQos [
        self subclassResponsibility
    ]

    setLogQos: aSequence [
        self subclassResponsibility
    ]

    getMaxRecordLife [
        "life in seconds (0 infinite)"
        self subclassResponsibility
    ]

    setMaxRecordLife: aLife [
        self subclassResponsibility
    ]

    getMaxSize [
        "size in octets"
        self subclassResponsibility
    ]

    setMaxSize: aSize [
        self subclassResponsibility
    ]

    getCurrentSize [
        "size in octets"
        self subclassResponsibility
    ]

    getNRecords [
        "number of records"
        self subclassResponsibility
    ]

    getLogFullAction [
        self subclassResponsibility
    ]

    setLogFullAction: aLogFullAction [
        self subclassResponsibility
    ]

    getAdministrativeState [
        self subclassResponsibility
    ]

    setAdministrativeState: anAdministrativeState [
        self subclassResponsibility
    ]

    getForwardingState [
        self subclassResponsibility
    ]

    setForwardingState: aForwardingState [
        self subclassResponsibility
    ]

    getOperationalState [
        self subclassResponsibility
    ]

    getInterval [
        "log duration"
        self subclassResponsibility
    ]

    setInterval: anInterval [
        self subclassResponsibility
    ]

    getAvailabilityStatus [
        "availability status"
        self subclassResponsibility
    ]

    getCapacityAlarmThresholds [
        "capacity alarm threshold"
        self subclassResponsibility
    ]

    setCapacityAlarmThresholds: aCapacityAlarmThresholdList [
        self subclassResponsibility
    ]

    getWeekMask [
        "weekly scheduling"
        self subclassResponsibility
    ]

    setWeekMask: aWeekMask [
        self subclassResponsibility
    ]

    "Name does not look nice because argument names do not either.
     Changing the IDL could lead to more readable #query:constraint:iterator"
    query: aString c: aConstraint i: anIterator [
        self subclassResponsibility
    ]

    retrieve: aTimeT howMany: aLong i: anIterator [
        "negative how_many indicates backwards retrieval"
        self subclassResponsibility
    ]

    match: aString c: aConstraint [
        "returns number of records matching constraint"
        self subclassResponsibility
    ]

    deleteRecords: aString c: aConstraint [
        "returns number of records deleted"
        self subclassResponsibility
    ]

    deleteRecordsById: aRecordIdList [
        self subclassResponsibility
    ]

    writeRecords: aAnySequence [
        self subclassResponsibility
    ]

    writeRecordList: aRecordList [
        self subclassResponsibility
    ]

    setRecordAttribute: aRecordId attrList: aNVList [
        "set single record attributes"
        self subclassResponsibility
    ]

    setRecordsAttribute: aString c: aConstraint attrList: aNVList [
        "set all records that matches the constraints with same attr_list
returns number of records whose attributes have been set"
        self subclassResponsibility
    ]

    getRecordAttribute: aRecordId [
        "get record attributes"
        self subclassResponsibility
    ]

    copy: anId [
        self subclassResponsibility
    ]

    copyWithId: anId [
        self subclassResponsibility
    ]

    flush [
        self subclassResponsibility
    ]
]

Log subclass: BasicLog [
    destroy [
        self subclassResponsibility
    ]
]

CORBA.ORBitObject subclass: LogMgr [
    listLogs [
        self subclassResponsibility
    ]

    findLog: anId [
        self subclassResponsibility
    ]

    listLogsById [
        self subclassResponsibility
    ]
]

LogMgr subclass: BasicLogFactory [
    create: aFullAction maxSize: aSize id: anId [
        self subclassResponsibility
    ]

    createWithId: anId fullAction: aFullAction maxSize: aSize [
        self subclassResponsibility
    ]
]
