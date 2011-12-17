require 'socket'      
require 'net/client'

class QueryClient < Client
  QUERY_PORT = 7777
  
  def initialize(host)
    super host,QUERY_PORT
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

