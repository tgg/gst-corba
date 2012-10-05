gst-corba
=========


What it is?
-----------

*gst-corba* is a pet project to implement [CORBA][] [Smalltalk
 Language Mapping][st] using [GNU Smalltalk][gst]

  [corba]: http://en.wikipedia.org/wiki/Common_Object_Request_Broker_Architecture
  [st]: http://www.omg.org/spec/ST/1.0/PDF
  [gst]: http://smalltalk.gnu.org


How to install it
-----------------

For now gst-corba requires git version of [GNU Smalltalk][gst]. See
[this page][git] for information on how to install git version of gst.

Running gst-corba require installing [ORBit2][orbit] packages, and
[tao-tls] implementation for tests. Assuming you're using Debian you
can do this with:

    $ sudo apt-get install liborbit2-dev tao-tls

As well as [gst-osprocess] to invoke tao-tls in unit tests:

    $ git clone git://github.com/MrGwen/gst-osprocess
    $ (cd gst-osprocess && ./package.sh)

Last, clone, setup and run gst-corba:

    $ git clone git://github.com/tgg/gst-corba.git
    $ cd gst-corba
    $ export LD_LIBRARY_PATH=$PWD/generated # Needed for stub lib
    $ make                                  # Also runs unit tests

  [git]: http://smalltalk.gnu.org/download/cvs
  [gst-osprocess]: http://github.com/MrGwen/gst-osprocess
  [tao-tls]: http://packages.debian.org/tao-tls


Current status
--------------

The project is in its inception. The first milestone is to implement a
minimal subset of the specification using [ORBit][] so that the
[Telecom Log Service][telco] can be called from gst.

  [orbit]: http://projects.gnome.org/ORBit2/
  [telco]: http://www.omg.org/spec/TLOG/1.1.2/PDF

### Implemented already

* `CORBAORB`
* `CORBAParameter`
* `CORBAObject`
* `CORBAEnum`
* sequence mapping
* minimal conversion to/from `any`

### Usability

As of `7f5e3a68d3` the `LogMgr` and `BasicLogFactory` interfaces are
wrapped.

As of `f6130f3` `Log` can be used to write log records.

As of `1285415` you can search log records.


How to use it
-------------

Here is an example session:

    st> PackageLoader fileInPackage: 'DsLogAdmin'.
    Loading package CORBA
    Loading package TimeBase
    Loading package OSProcess
    Loading package DsLogAdmin
    PackageLoader
    st> orb := CORBA.ORBitORB new: 'gst' withArgs: #().
    an ORBitORB
    "assuming you have a running instance of a CORBA Telecom Log Server
     with the following IOR"
    st> logmgr := orb stringToObject: 'IOR:010000002b00000049444c3a6f6d672e6f72672f44734c6f6741646d696e2f42617369634c6f67466163746f72793a312e30000001000000000000007c000000010102000a0000003132372e302e302e3100a8b92f00000014010f004e53500000000001000000526f6f74504f4100666163746f72795f504f41000000000001000000010000000002000000000000000800000001000000004f41540100000018000000010000000100010001000000010001050901010000000000'.
    DsLogAdmin.ORBitBasicLogFactory(16r85D9980)
    st> log := logmgr create: 0 maxSize: 0 id: (id := nil asCORBAParameter).
    DsLogAdmin.ORBitBasicLog(16r85DCCE0)
    st> id value.
    0 "or any other positive value"
    st> log id.
    0
    st> logmgr findLog: 0.
    DsLogAdmin.ORBitBasicLog(16r85DCCE0) "the same newly created log"
    st> logmgr create: 0 maxSize: 0 id: (id := nil asCORBAParameter).
    DsLogAdmin.ORBitBasicLog(16r85DEBE0)
    st> logmgr listLogsById.
    OrderedCollection (0 1 )
    st> logmgr listLogs.
    OrderedCollection (DsLogAdmin.Log(16r85DE76C) DsLogAdmin.Log(16r85DE770) )
    st> log writeRecords: #('Hello' 'There' 'How' 'are you?').

