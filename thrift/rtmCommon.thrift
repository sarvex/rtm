namespace cpp apache.thrift.rtmCommon
namespace csharp Rtm.Connection
namespace php serverGated
namespace go serverGated

struct friendPair
{
        1: i64 uidA,
        2: i64 uidB
}

exception RTMException {
        1: i32 code,
        2: string message
}

struct MsgNum {
    1:byte msg_type,
    2:i64 from_xid,
    3:i32 num,
}

struct MsgParam {
    1:byte msg_type,
    2:i64 from_xid,
    3:i32 num,
    4:i64 offset,
}

struct MsgContent {
    1:string body,
    2:i32 mtime,
    3:byte mtype,
    4:i64 uid,
}

struct MsgResult {
    1:byte msg_type,
    2:i64 from_xid,
    3:i32 num,
    4:i64 offset,
    5:list<MsgContent> msgs,
}
