"======================================================================
|
|   Hand-written stub file
|
 ======================================================================"

Eval [
    "Missing dict"
    CORBAConstants at: '::DsLogAdmin::InvalidParam' put: CORBA.CORBAException new.
    CORBAConstants at: '::DsLogAdmin::InvalidThreshold' put: CORBA.CORBAException new.
    CORBAConstants at: '::DsLogAdmin::InvalidTime' put: CORBA.CORBAException new.
    CORBAConstants at: '::DsLogAdmin::InvalidTimeInterval' put: CORBA.CORBAException new.
    CORBAConstants at: '::DsLogAdmin::InvalidMask' put: CORBA.CORBAException new.
    CORBAConstants at: '::DsLogAdmin::LogIdAlreadyExists' put: CORBA.CORBAException new.
    CORBAConstants at: '::DsLogAdmin::InvalidGrammar' put: CORBA.CORBAException new.
    CORBAConstants at: '::DsLogAdmin::InvalidConstraint' put: CORBA.CORBAException new.
    "Missing dict"
    CORBAConstants at: '::DsLogAdmin::LogFull' put: CORBA.CORBAException new.
    CORBAConstants at: '::DsLogAdmin::LogOffDuty' put: CORBA.CORBAException new.
    CORBAConstants at: '::DsLogAdmin::LogLocked' put: CORBA.CORBAException new.
    CORBAConstants at: '::DsLogAdmin::LogDisabled' put: CORBA.CORBAException new.
    CORBAConstants at: '::DsLogAdmin::InvalidRecordId' put: CORBA.CORBAException new.
    "Missing dict"
    CORBAConstants at: '::DsLogAdmin::InvalidAttribute' put: CORBA.CORBAException new.
    CORBAConstants at: '::DsLogAdmin::InvalidLogFullAction' put: CORBA.CORBAException new.

    CORBAConstants at: '::DsLogAdmin::default_grammar' put: 'EXTENDED_TCL'.
]

Dictionary subclass: NVPair [
    NVPair class >> new [
	<category: 'instance creation'>
        ^self basicNew
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
    TimeInterval class >> new [
	<category: 'instance creation'>
        ^self basicNew
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
    LogRecord class >> new [
	<category: 'instance creation'>
        ^self basicNew
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
        self at: #attrList put: aNVList
    ]

    attrList [
        ^self at: #attrList
    ]

    info: anAny [
        self at: #info put: anAny
    ]

    info [
        ^self at: #info
    ]
]

Object subclass: Iterator [
    get: anIndex howMany: aCount [
        self subclassResponsibility
    ]

    destroy [
        self subclassResponsibility
    ]
]

Dictionary subclass: AvailabilityStatus [
    AvailabilityStatus class >> new [
	<category: 'instance creation'>
        ^self basicNew
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
    Time24 class >> new [
	<category: 'instance creation'>
        ^self basicNew
    ]

    hour: aBoolean [
        self at: #hour put: aBoolean
    ]

    hour [
        ^self at: #hour
    ]

    minute: aBoolean [
        self at: #minute put: aBoolean
    ]

    minute [
        ^self at: #minute
    ]
]

Dictionary subclass: Time24Interval [
    Time24Interval class >> new [
	<category: 'instance creation'>
        ^self basicNew
    ]

    start: aBoolean [
        self at: #start put: aBoolean
    ]

    start [
        ^self at: #start
    ]

    stop: aBoolean [
        self at: #stop put: aBoolean
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
    WeekMaskItem class >> new [
	<category: 'instance creation'>
        ^self basicNew
    ]

    days: aBoolean [
        self at: #days put: aBoolean
    ]

    days [
        ^self at: #days
    ]

    intervals: aBoolean [
        self at: #intervals put: aBoolean
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

CORBA.CORBAEnum subclass: AdministrativeState [
    AdministrativeState class >> values [
        ^#('::DsLogAdmin::locked' '::DsLogAdmin::unlocked')
    ]
]

CORBA.CORBAEnum subclass: ForwardingState [
    ForwardingState class >> values [
        ^#('::DsLogAdmin::on' '::DsLogAdmin::off')
    ]
]

Eval [
    "Missing dict"
    CORBAConstants at: '::DsLogAdmin::UnsupportedQoS' put: CORBA.CORBAException new.

    CORBAConstants at: '::DsLogAdmin::QoSNone' put: 0.
    CORBAConstants at: '::DsLogAdmin::QoSFlush' put: 1.
    CORBAConstants at: '::DsLogAdmin::QoSReliability' put: 2.
]

Object subclass: Log [
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
        self subclassResponsibility
    ]

    setMaxRecordLife: aLife [
        self subclassResponsibility
    ]

    getMaxSize [
        self subclassResponsibility
    ]

    setMaxSize: aSize [
        self subclassResponsibility
    ]

    "..."
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

Object subclass: LogMgr [
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
