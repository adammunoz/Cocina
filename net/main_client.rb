require 'socket'
require 'net/client'

class MainClient < Client
  #todo: properly close the socket when existing program
  def initialize(host)
    super host, 8888
  end
  
  def wait_for_msgs # Receives a block
    while line = @client.gets
      yield line.chop
    end
  end
end