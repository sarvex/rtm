all:gen

gen:
	@thrift -gen go thrift/fp1225.thrift
	@thrift -gen go thrift/rtmCommon.thrift
	@thrift -gen go thrift/serverGated.thrift

clean:
	@rm -rf gen-go
