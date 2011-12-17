require 'socket'
require 'net/client'

class MainClient < Client
  def initialize(host)
    super host, 8888
  end
  
  def wait_for_msgs
    while line = @client.gets
      puts line.chop
    end
  end
  
end