"======================================================================
|
| CORBA TimeBase hand-written classes for:
|  - TimeBase::UtcT
|  - TimeBase::IntervalT
|
| The spec says that an IDL struct is mapped to a Smalltalk Dictionary.
|
| So the following classes are not really needed. I think the
| implementation should be able to cope with any Dictionary provided
| it has the right keys.
|
| These classes provide getter and setter messages but *no* validation.
| The validation of data has to be done before sending it, so that it
| also works with pure Dictionary instances.
|
 ======================================================================"

Dictionary subclass: UtcT [
    <shape: #pointer>

    UtcT class >> new [
	<category: 'instance creation'>
        ^self from: {#time -> 0 . #inacclo -> 0 . #inacchi -> 0 . #tdf -> 0}
    ]

    time: anUnsignedLongLong [
        self at: #time put: anUnsignedLongLong
    ]

    time [
        ^self at: #time
    ]

    inacclo: anUnsignedLong [
        self at: #inacclo put: anUnsignedLong
    ]

    inacclo [
        ^self at: #inacclo
    ]

    inacchi: anUnsignedLong [
        self at: #inacchi put: anUnsignedLong
    ]

    inacchi [
        ^self at: #inacchi
    ]

    tdf: aShort [
        self at: #tdf put: aShort
    ]

    tdf [
        ^self at: #tdf
    ]
]

Dictionary subclass: IntervalT [
    <shape: #pointer>

    IntervalT class >> new [
	<category: 'instance creation'>
        ^self from: {#lowerBound -> 0 . #upperBound -> 0}
    ]

    lowerBound: anUnsignedLongLong [
        self at: #lowerBound put: anUnsignedLongLong
    ]

    lowerBound [
        ^self at: #lowerBound
    ]

    upperBound: anUnsignedLongLong [
        self at: #upperBound put: anUnsignedLongLong
    ]

    upperBound [
        ^self at: #upperBound
    ]
]
