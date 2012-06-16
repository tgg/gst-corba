TestCase subclass: ORBitTest [
    IOR := 'IOR:010000002b00000049444c3a6f6d672e6f72672f44734c6f6741646d696e2f42617369634c6f67466163746f72793a312e30000001000000000000007c000000010102000a0000003132372e302e302e3100d2042f00000014010f004e53500000000001000000526f6f74504f4100666163746f72795f504f41000000000001000000010000000002000000000000000800000001000000004f41540100000018000000010000000100010001000000010001050901010000000000'.
    ORB := ORBitORB new: 'gst' withArgs: #().

    ORBitTest class >>  stringToObject: aString [
        ^ORB stringToObject: aString
    ]

    ORBitTest class >> logManager [
        ^self stringToObject: IOR
    ]

    testCORBAORB [
        | ex fake |
        self assert: (ORB stringToObject: IOR) notNil.
        self assert: (ORB objectToString: (ORB stringToObject: IOR)) = IOR.
        self assert: (ORB stringToObject: nil) isNil.
        self assert: (ORB objectToString: nil) isNil.
        fake := 'dummy-failing-address'.
        ex := CORBAConstants at: '::CORBA::BAD_PARAM'.
        self assert: (ex corbaHandle: [:ev | ev] do: [ORB stringToObject: fake]) class == ex.
        ex := CORBA.SystemException.
        self assert: (ex corbaHandle: [:ev | ev] do: [ORB stringToObject: fake]) class == CORBA.BADPARAM
    ]

    testCORBAObject [
        | obj |
        obj := ORB stringToObject: IOR.
        self assert: (obj isA: 'IDL:omg.org/DsLogAdmin/BasicLogFactory:1.0').
        self should: [ORBitORB typeId: nil] raise: SystemExceptions.InvalidArgument.
        self assert: obj id = 'IDL:omg.org/DsLogAdmin/BasicLogFactory:1.0'
    ]

    testCORBASequence [
        | orbitSeq seq |
        seq := (OrderedCollection new: 5)
            add: 2;
            add: 3;
            add: 4;
            add: 5;
            add: 6;
            yourself.
        orbitSeq := seq asORBitSequenceOf: CULongLong.
        self assert: orbitSeq length value = 5.
        self assert: (orbitSeq buffer value at: 0) = 2.
        self assert: (orbitSeq buffer value at: 1) = 3.
        self assert: (orbitSeq buffer value at: 2) = 4.
        self assert: (orbitSeq buffer value at: 3) = 5.
        self assert: (orbitSeq buffer value at: 4) = 6.
        self assert: orbitSeq asOrderedCollection = seq.
        orbitSeq free.
        seq := OrderedCollection new.
        orbitSeq := seq asORBitSequenceOf: CULongLong.
        self assert: orbitSeq length value = 0.
        self assert: orbitSeq buffer value isNil.
        orbitSeq free.
    ]

    testAsORBitAny [
        self assert: 1 asORBitAny tc value repoId value = 'IDL:omg.org/CORBA/unsigned_short:1.0'.
        self assert: 0 asORBitAny tc value repoId value = 'IDL:omg.org/CORBA/unsigned_short:1.0'.
        self assert: -1 asORBitAny tc value repoId value = 'IDL:omg.org/CORBA/short:1.0'.
        self assert: (-2 raisedTo: 15) asORBitAny tc value repoId value = 'IDL:omg.org/CORBA/short:1.0'.
        self assert: ((-2 raisedTo: 15) - 1) asORBitAny tc value repoId value = 'IDL:omg.org/CORBA/long:1.0'.
        self assert: (-2 raisedTo: 31) asORBitAny tc value repoId value = 'IDL:omg.org/CORBA/long:1.0'.
        self assert: ((-2 raisedTo: 31) - 1) asORBitAny tc value repoId value = 'IDL:omg.org/CORBA/long_long:1.0'.
        self assert: (-2 raisedTo: 63) asORBitAny tc value repoId value = 'IDL:omg.org/CORBA/long_long:1.0'.
        self assert: ((2 raisedTo: 16) - 1) asORBitAny tc value repoId value = 'IDL:omg.org/CORBA/unsigned_short:1.0'.
        self assert: ((2 raisedTo: 32) - 1) asORBitAny tc value repoId value = 'IDL:omg.org/CORBA/unsigned_long:1.0'.
        self assert: ((2 raisedTo: 64) - 1) asORBitAny tc value repoId value = 'IDL:omg.org/CORBA/unsigned_long_long:1.0'.
        self assert: true asORBitAny tc value repoId value = 'IDL:omg.org/CORBA/boolean:1.0'.
        self assert: '' asORBitAny tc value repoId value = 'IDL:omg.org/CORBA/string:1.0'
        "TODO interface? object_ref? any enum union struct fixed sequence wstring array exception"
    ]
]
