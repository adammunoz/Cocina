require 'socket'
require 'net/client'
require 'conf/cocina_gconf'
require 'cocina_log'


class MainClient < Client
  include Conf
  include CocinaLog
  #todo: properly close the socket when existing program
  def initialize
    log.info "Main server: #{client["/apps/cocina/host"]} - #{client["/apps/cocina/main_port"]}"
    super client["/apps/cocina/host"], client["/apps/cocina/main_port"]
  end
  
  def wait_for_msgs # Receives a block
    while line = @client.gets
      yield line.chop
    end
  end
end