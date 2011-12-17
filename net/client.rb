require 'socket'

class Client
  def initialize(host,port)
    @client = TCPSocket.open(host, port)
  end
end