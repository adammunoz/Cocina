require 'socket'      

class QueryClient
  def initialize(host,port)
    @client = TCPSocket.open(host, port)
  end
  
  def get_num_mesas
    return (query 'dbQuery@numMesas').to_i
  end
  
  private
  def query(request)
    @client.puts request
    return @client.gets
  end
  
end

