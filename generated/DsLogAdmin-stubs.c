/*
 * This file was generated by orbit-idl-2 - DO NOT EDIT!
 */

#include <string.h>
#define ORBIT2_STUBS_API
#include "DsLogAdmin.h"

DsLogAdmin_RecordList* DsLogAdmin_Iterator_get(DsLogAdmin_Iterator _obj, const CORBA_unsigned_long position, const CORBA_unsigned_long how_many, CORBA_Environment *ev){
DsLogAdmin_RecordList* _ORBIT_retval;
gpointer _args[2];
_args[0] = (gpointer)&position;
_args[1] = (gpointer)&how_many;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Iterator__iinterface.methods, 0, &_ORBIT_retval, _args, NULL, ev, DsLogAdmin_Iterator__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Iterator__epv, get),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Iterator_get);

return _ORBIT_retval;
}
void DsLogAdmin_Iterator_destroy(DsLogAdmin_Iterator _obj, CORBA_Environment *ev){
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Iterator__iinterface.methods, 1, NULL, NULL, NULL, ev, DsLogAdmin_Iterator__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Iterator__epv, destroy),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Iterator_destroy);

}
DsLogAdmin_LogMgr DsLogAdmin_Log_my_factory(DsLogAdmin_Log _obj, CORBA_Environment *ev){
DsLogAdmin_LogMgr _ORBIT_retval;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 0, &_ORBIT_retval, NULL, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, my_factory),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_my_factory);

return _ORBIT_retval;
}
DsLogAdmin_LogId DsLogAdmin_Log_id(DsLogAdmin_Log _obj, CORBA_Environment *ev){
DsLogAdmin_LogId _ORBIT_retval;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 1, &_ORBIT_retval, NULL, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, id),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_id);

return _ORBIT_retval;
}
DsLogAdmin_QoSList* DsLogAdmin_Log_get_log_qos(DsLogAdmin_Log _obj, CORBA_Environment *ev){
DsLogAdmin_QoSList* _ORBIT_retval;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 2, &_ORBIT_retval, NULL, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, get_log_qos),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_get_log_qos);

return _ORBIT_retval;
}
void DsLogAdmin_Log_set_log_qos(DsLogAdmin_Log _obj, const DsLogAdmin_QoSList* qos, CORBA_Environment *ev){
gpointer _args[1];
_args[0] = (gpointer)qos;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 3, NULL, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, set_log_qos),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_set_log_qos);

}
CORBA_unsigned_long DsLogAdmin_Log_get_max_record_life(DsLogAdmin_Log _obj, CORBA_Environment *ev){
CORBA_unsigned_long _ORBIT_retval;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 4, &_ORBIT_retval, NULL, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, get_max_record_life),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_get_max_record_life);

return _ORBIT_retval;
}
void DsLogAdmin_Log_set_max_record_life(DsLogAdmin_Log _obj, const CORBA_unsigned_long life, CORBA_Environment *ev){
gpointer _args[1];
_args[0] = (gpointer)&life;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 5, NULL, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, set_max_record_life),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_set_max_record_life);

}
CORBA_unsigned_long_long DsLogAdmin_Log_get_max_size(DsLogAdmin_Log _obj, CORBA_Environment *ev){
CORBA_unsigned_long_long _ORBIT_retval;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 6, &_ORBIT_retval, NULL, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, get_max_size),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_get_max_size);

return _ORBIT_retval;
}
void DsLogAdmin_Log_set_max_size(DsLogAdmin_Log _obj, const CORBA_unsigned_long_long size, CORBA_Environment *ev){
gpointer _args[1];
_args[0] = (gpointer)&size;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 7, NULL, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, set_max_size),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_set_max_size);

}
CORBA_unsigned_long_long DsLogAdmin_Log_get_current_size(DsLogAdmin_Log _obj, CORBA_Environment *ev){
CORBA_unsigned_long_long _ORBIT_retval;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 8, &_ORBIT_retval, NULL, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, get_current_size),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_get_current_size);

return _ORBIT_retval;
}
CORBA_unsigned_long_long DsLogAdmin_Log_get_n_records(DsLogAdmin_Log _obj, CORBA_Environment *ev){
CORBA_unsigned_long_long _ORBIT_retval;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 9, &_ORBIT_retval, NULL, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, get_n_records),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_get_n_records);

return _ORBIT_retval;
}
DsLogAdmin_LogFullActionType DsLogAdmin_Log_get_log_full_action(DsLogAdmin_Log _obj, CORBA_Environment *ev){
DsLogAdmin_LogFullActionType _ORBIT_retval;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 10, &_ORBIT_retval, NULL, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, get_log_full_action),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_get_log_full_action);

return _ORBIT_retval;
}
void DsLogAdmin_Log_set_log_full_action(DsLogAdmin_Log _obj, const DsLogAdmin_LogFullActionType action, CORBA_Environment *ev){
gpointer _args[1];
_args[0] = (gpointer)&action;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 11, NULL, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, set_log_full_action),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_set_log_full_action);

}
DsLogAdmin_AdministrativeState DsLogAdmin_Log_get_administrative_state(DsLogAdmin_Log _obj, CORBA_Environment *ev){
DsLogAdmin_AdministrativeState _ORBIT_retval;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 12, &_ORBIT_retval, NULL, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, get_administrative_state),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_get_administrative_state);

return _ORBIT_retval;
}
void DsLogAdmin_Log_set_administrative_state(DsLogAdmin_Log _obj, const DsLogAdmin_AdministrativeState state, CORBA_Environment *ev){
gpointer _args[1];
_args[0] = (gpointer)&state;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 13, NULL, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, set_administrative_state),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_set_administrative_state);

}
DsLogAdmin_ForwardingState DsLogAdmin_Log_get_forwarding_state(DsLogAdmin_Log _obj, CORBA_Environment *ev){
DsLogAdmin_ForwardingState _ORBIT_retval;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 14, &_ORBIT_retval, NULL, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, get_forwarding_state),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_get_forwarding_state);

return _ORBIT_retval;
}
void DsLogAdmin_Log_set_forwarding_state(DsLogAdmin_Log _obj, const DsLogAdmin_ForwardingState state, CORBA_Environment *ev){
gpointer _args[1];
_args[0] = (gpointer)&state;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 15, NULL, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, set_forwarding_state),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_set_forwarding_state);

}
DsLogAdmin_OperationalState DsLogAdmin_Log_get_operational_state(DsLogAdmin_Log _obj, CORBA_Environment *ev){
DsLogAdmin_OperationalState _ORBIT_retval;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 16, &_ORBIT_retval, NULL, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, get_operational_state),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_get_operational_state);

return _ORBIT_retval;
}
DsLogAdmin_TimeInterval DsLogAdmin_Log_get_interval(DsLogAdmin_Log _obj, CORBA_Environment *ev){
DsLogAdmin_TimeInterval _ORBIT_retval;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 17, &_ORBIT_retval, NULL, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, get_interval),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_get_interval);

return _ORBIT_retval;
}
void DsLogAdmin_Log_set_interval(DsLogAdmin_Log _obj, const DsLogAdmin_TimeInterval* interval, CORBA_Environment *ev){
gpointer _args[1];
_args[0] = (gpointer)interval;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 18, NULL, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, set_interval),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_set_interval);

}
DsLogAdmin_AvailabilityStatus DsLogAdmin_Log_get_availability_status(DsLogAdmin_Log _obj, CORBA_Environment *ev){
DsLogAdmin_AvailabilityStatus _ORBIT_retval;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 19, &_ORBIT_retval, NULL, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, get_availability_status),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_get_availability_status);

return _ORBIT_retval;
}
DsLogAdmin_CapacityAlarmThresholdList* DsLogAdmin_Log_get_capacity_alarm_thresholds(DsLogAdmin_Log _obj, CORBA_Environment *ev){
DsLogAdmin_CapacityAlarmThresholdList* _ORBIT_retval;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 20, &_ORBIT_retval, NULL, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, get_capacity_alarm_thresholds),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_get_capacity_alarm_thresholds);

return _ORBIT_retval;
}
void DsLogAdmin_Log_set_capacity_alarm_thresholds(DsLogAdmin_Log _obj, const DsLogAdmin_CapacityAlarmThresholdList* threshs, CORBA_Environment *ev){
gpointer _args[1];
_args[0] = (gpointer)threshs;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 21, NULL, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, set_capacity_alarm_thresholds),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_set_capacity_alarm_thresholds);

}
DsLogAdmin_WeekMask* DsLogAdmin_Log_get_week_mask(DsLogAdmin_Log _obj, CORBA_Environment *ev){
DsLogAdmin_WeekMask* _ORBIT_retval;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 22, &_ORBIT_retval, NULL, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, get_week_mask),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_get_week_mask);

return _ORBIT_retval;
}
void DsLogAdmin_Log_set_week_mask(DsLogAdmin_Log _obj, const DsLogAdmin_WeekMask* masks, CORBA_Environment *ev){
gpointer _args[1];
_args[0] = (gpointer)masks;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 23, NULL, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, set_week_mask),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_set_week_mask);

}
DsLogAdmin_RecordList* DsLogAdmin_Log_query(DsLogAdmin_Log _obj, const CORBA_char * grammar, const CORBA_char * c, DsLogAdmin_Iterator* i, CORBA_Environment *ev){
DsLogAdmin_RecordList* _ORBIT_retval;
gpointer _args[3];
_args[0] = (gpointer)&grammar;
_args[1] = (gpointer)&c;
_args[2] = &i;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 24, &_ORBIT_retval, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, query),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_query);

return _ORBIT_retval;
}
DsLogAdmin_RecordList* DsLogAdmin_Log_retrieve(DsLogAdmin_Log _obj, const DsLogAdmin_TimeT from_time, const CORBA_long how_many, DsLogAdmin_Iterator* i, CORBA_Environment *ev){
DsLogAdmin_RecordList* _ORBIT_retval;
gpointer _args[3];
_args[0] = (gpointer)&from_time;
_args[1] = (gpointer)&how_many;
_args[2] = &i;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 25, &_ORBIT_retval, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, retrieve),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_retrieve);

return _ORBIT_retval;
}
CORBA_unsigned_long DsLogAdmin_Log_match(DsLogAdmin_Log _obj, const CORBA_char * grammar, const CORBA_char * c, CORBA_Environment *ev){
CORBA_unsigned_long _ORBIT_retval;
gpointer _args[2];
_args[0] = (gpointer)&grammar;
_args[1] = (gpointer)&c;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 26, &_ORBIT_retval, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, match),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_match);

return _ORBIT_retval;
}
CORBA_unsigned_long DsLogAdmin_Log_delete_records(DsLogAdmin_Log _obj, const CORBA_char * grammar, const CORBA_char * c, CORBA_Environment *ev){
CORBA_unsigned_long _ORBIT_retval;
gpointer _args[2];
_args[0] = (gpointer)&grammar;
_args[1] = (gpointer)&c;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 27, &_ORBIT_retval, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, delete_records),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_delete_records);

return _ORBIT_retval;
}
CORBA_unsigned_long DsLogAdmin_Log_delete_records_by_id(DsLogAdmin_Log _obj, const DsLogAdmin_RecordIdList* ids, CORBA_Environment *ev){
CORBA_unsigned_long _ORBIT_retval;
gpointer _args[1];
_args[0] = (gpointer)ids;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 28, &_ORBIT_retval, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, delete_records_by_id),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_delete_records_by_id);

return _ORBIT_retval;
}
void DsLogAdmin_Log_write_records(DsLogAdmin_Log _obj, const DsLogAdmin_Anys* records, CORBA_Environment *ev){
gpointer _args[1];
_args[0] = (gpointer)records;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 29, NULL, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, write_records),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_write_records);

}
void DsLogAdmin_Log_write_recordlist(DsLogAdmin_Log _obj, const DsLogAdmin_RecordList* list, CORBA_Environment *ev){
gpointer _args[1];
_args[0] = (gpointer)list;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 30, NULL, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, write_recordlist),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_write_recordlist);

}
void DsLogAdmin_Log_set_record_attribute(DsLogAdmin_Log _obj, const DsLogAdmin_RecordId id, const DsLogAdmin_NVList* attr_list, CORBA_Environment *ev){
gpointer _args[2];
_args[0] = (gpointer)&id;
_args[1] = (gpointer)attr_list;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 31, NULL, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, set_record_attribute),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_set_record_attribute);

}
CORBA_unsigned_long DsLogAdmin_Log_set_records_attribute(DsLogAdmin_Log _obj, const CORBA_char * grammar, const CORBA_char * c, const DsLogAdmin_NVList* attr_list, CORBA_Environment *ev){
CORBA_unsigned_long _ORBIT_retval;
gpointer _args[3];
_args[0] = (gpointer)&grammar;
_args[1] = (gpointer)&c;
_args[2] = (gpointer)attr_list;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 32, &_ORBIT_retval, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, set_records_attribute),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_set_records_attribute);

return _ORBIT_retval;
}
DsLogAdmin_NVList* DsLogAdmin_Log_get_record_attribute(DsLogAdmin_Log _obj, const DsLogAdmin_RecordId id, CORBA_Environment *ev){
DsLogAdmin_NVList* _ORBIT_retval;
gpointer _args[1];
_args[0] = (gpointer)&id;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 33, &_ORBIT_retval, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, get_record_attribute),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_get_record_attribute);

return _ORBIT_retval;
}
DsLogAdmin_Log DsLogAdmin_Log_copy(DsLogAdmin_Log _obj, DsLogAdmin_LogId* id, CORBA_Environment *ev){
DsLogAdmin_Log _ORBIT_retval;
gpointer _args[1];
_args[0] = &id;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 34, &_ORBIT_retval, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, copy),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_copy);

return _ORBIT_retval;
}
DsLogAdmin_Log DsLogAdmin_Log_copy_with_id(DsLogAdmin_Log _obj, const DsLogAdmin_LogId id, CORBA_Environment *ev){
DsLogAdmin_Log _ORBIT_retval;
gpointer _args[1];
_args[0] = (gpointer)&id;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 35, &_ORBIT_retval, _args, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, copy_with_id),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_copy_with_id);

return _ORBIT_retval;
}
void DsLogAdmin_Log_flush(DsLogAdmin_Log _obj, CORBA_Environment *ev){
ORBit_c_stub_invoke (_obj, &DsLogAdmin_Log__iinterface.methods, 36, NULL, NULL, NULL, ev, DsLogAdmin_Log__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_Log__epv, flush),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_Log_flush);

}
void DsLogAdmin_BasicLog_destroy(DsLogAdmin_BasicLog _obj, CORBA_Environment *ev){
ORBit_c_stub_invoke (_obj, &DsLogAdmin_BasicLog__iinterface.methods, 0, NULL, NULL, NULL, ev, DsLogAdmin_BasicLog__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_BasicLog__epv, destroy),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_BasicLog_destroy);

}
DsLogAdmin_LogList* DsLogAdmin_LogMgr_list_logs(DsLogAdmin_LogMgr _obj, CORBA_Environment *ev){
DsLogAdmin_LogList* _ORBIT_retval;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_LogMgr__iinterface.methods, 0, &_ORBIT_retval, NULL, NULL, ev, DsLogAdmin_LogMgr__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_LogMgr__epv, list_logs),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_LogMgr_list_logs);

return _ORBIT_retval;
}
DsLogAdmin_Log DsLogAdmin_LogMgr_find_log(DsLogAdmin_LogMgr _obj, const DsLogAdmin_LogId id, CORBA_Environment *ev){
DsLogAdmin_Log _ORBIT_retval;
gpointer _args[1];
_args[0] = (gpointer)&id;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_LogMgr__iinterface.methods, 1, &_ORBIT_retval, _args, NULL, ev, DsLogAdmin_LogMgr__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_LogMgr__epv, find_log),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_LogMgr_find_log);

return _ORBIT_retval;
}
DsLogAdmin_LogIdList* DsLogAdmin_LogMgr_list_logs_by_id(DsLogAdmin_LogMgr _obj, CORBA_Environment *ev){
DsLogAdmin_LogIdList* _ORBIT_retval;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_LogMgr__iinterface.methods, 2, &_ORBIT_retval, NULL, NULL, ev, DsLogAdmin_LogMgr__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_LogMgr__epv, list_logs_by_id),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_LogMgr_list_logs_by_id);

return _ORBIT_retval;
}
DsLogAdmin_BasicLog DsLogAdmin_BasicLogFactory_create(DsLogAdmin_BasicLogFactory _obj, const DsLogAdmin_LogFullActionType full_action, const CORBA_unsigned_long_long max_size, DsLogAdmin_LogId* id, CORBA_Environment *ev){
DsLogAdmin_BasicLog _ORBIT_retval;
gpointer _args[3];
_args[0] = (gpointer)&full_action;
_args[1] = (gpointer)&max_size;
_args[2] = &id;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_BasicLogFactory__iinterface.methods, 0, &_ORBIT_retval, _args, NULL, ev, DsLogAdmin_BasicLogFactory__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_BasicLogFactory__epv, create),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_BasicLogFactory_create);

return _ORBIT_retval;
}
DsLogAdmin_BasicLog DsLogAdmin_BasicLogFactory_create_with_id(DsLogAdmin_BasicLogFactory _obj, const DsLogAdmin_LogId id, const DsLogAdmin_LogFullActionType full_action, const CORBA_unsigned_long_long max_size, CORBA_Environment *ev){
DsLogAdmin_BasicLog _ORBIT_retval;
gpointer _args[3];
_args[0] = (gpointer)&id;
_args[1] = (gpointer)&full_action;
_args[2] = (gpointer)&max_size;
ORBit_c_stub_invoke (_obj, &DsLogAdmin_BasicLogFactory__iinterface.methods, 1, &_ORBIT_retval, _args, NULL, ev, DsLogAdmin_BasicLogFactory__classid, G_STRUCT_OFFSET (POA_DsLogAdmin_BasicLogFactory__epv, create_with_id),
(ORBitSmallSkeleton) _ORBIT_skel_small_DsLogAdmin_BasicLogFactory_create_with_id);

return _ORBIT_retval;
}