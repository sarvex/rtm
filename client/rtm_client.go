// TODO - use a pool

package proxy

import (
    "github.com/funkygao/rtm/gen-go/serverGated"
    "git.apache.org/thrift.git/lib/go/thrift"
    log "github.com/funkygao/log4go"
    "time"
    "net"
)

func NewRtmClient(addr string) (client *ServerGatedServiceClient, err error) {
    transportFactory := thrift.NewTBufferedTransportFactory(8192)
    transport, err := thrift.NewTSocketTimeout(addr, time.Second * 10)
    if err != nil {
        return nil, err
    }

    if err = transport.Open(); err != nil {
        log.Error("conn peer[%s]: %s", addr, err)

        return nil, err
    }

    if tcpConn, ok := transport.Conn().(*net.TCPConn); ok {
        // nagle's only applies to client rather than server
        tcpConn.SetNoDelay(true)
    }

    client = NewServerGatedServiceClientFactory(
        transportFactory.GetTransport(transport),
        thrift.NewTBinaryProtocolFactoryDefault())

    return client, nil
}
