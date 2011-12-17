require 'socket'      
require 'net/client'
require 'conf/cocina_gconf'


class QueryClient < Client
  include Conf
  def initialize
    super client["/apps/cocina/host"],client["/apps/cocina/query_port"]
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

