include "fp1225.thrift"
include "rtmCommon.thrift"

namespace cpp apache.thrift.servergated
namespace php serverGated
namespace py serverGated
namespace go serverGated

exception serverGatedException {
    1:i32 code,
    2:string reason,
}

struct Token {
    1:i32 project_id,
    2:string auth_token,
}

service serverGatedService extends fp1225.FunplusService{
    i32 send_msg( 1:i32 project_id, 2:string key, 3:byte mtype, 4:i64 from, 5:i64 to, 6:i64 mid, 7:string message) throws (1:serverGatedException ex),
    i32 send_msgs(1:i32 project_id, 2:string key, 3:byte mtype, 4:i64 from, 5:list<i64> tos, 6:i64 mid, 7:string message) throws (1:serverGatedException ex),
    i32 send_group_msg(1:i32 project_id, 2:string key, 3:byte mtype, 4:i64 from, 5:i64 group_id, 6:i64 mid, 7:string message) throws (1:serverGatedException ex),
    i32 broadcast_msg(1:i32 project_id, 2:string key, 3:byte mtype, 4:i64 from, 5:i64 mid, 6:string message) throws (1:serverGatedException ex),
    oneway void broadcast_note ( 1:i32 project_id, 2:string key, 3:byte mtype, 4:i64 from, 5:string message),
    oneway void send_note (1:i32 project_id, 2:string key, 3:byte mtype, 4:i64 from, 5:i64 to, 6:string message),
    oneway void send_notes(1:i32 project_id, 2:string key, 3:byte mtype, 4:i64 from, 5:list<i64> tos, 6:string message),
    oneway void send_group_note(1:i32 project_id, 2:string key, 3:byte mtype, 4:i64 from, 5:i64 group_id, 6:string message),
    void friend_changed(1:i32 project_id, 2:string key, 3:byte otype, 4:list<rtmCommon.friendPair> uid_pair) throws (1:serverGatedException ex),
    i64 create_group(1:i32 project_id, 2:string key, 3:i64 group_id, 4:string group_name) throws (1:serverGatedException ex),
    void delete_group(1:i32 project_id, 2:string key, 3:i64 group_id) throws (1:serverGatedException ex),
    i64 join_group(1: i32 project_id, 2:string key, 3: i64 group_id, 4: i64 who) throws (1:serverGatedException ex),
    void group_changed(1:i32 project_id, 2:string key, 3:byte otype, 4:i64 group_id, 5:list<i64> uids) throws (1:serverGatedException ex),
    Token get_token (1:i32 project_id, 2:string key, 3:i64 uid) throws (1:serverGatedException ex),
}
