Worked aound
------------

* Load prereq test dependencies


Missing
-------

* `Log>>#writeRecordList:`
* `Log>>#setRecordAttribute:attrList:`
* `Log>>#setRecordsAttribute:c:attrList:`
* `Log>>#getRecordAttribute:`
* `Log>>#copy:`
* `Log>>#copyWithId:`


Not complete
------------

* Mapping to any


Broken
------

* `Log>>#getInterval`
* `Log>>#getAvailabilityStatus`
* It looks like if accessing an already created log with
  LogMgr>>#listLog then using #at: does not correctly bootstrap
  the object. LogMgr>>#findLog: works.


Misbehaving
-----------

* Memory leaks
* Exceptions not checked everywhere
