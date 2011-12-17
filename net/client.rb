require 'socket'
require 'cocina_log'
class Client
  include CocinaLog
  def initialize(host,port)
    @client = TCPSocket.open(host, port)
  end
  
  def clean
    @client.close
    log.info "Socket closed"
  end
end