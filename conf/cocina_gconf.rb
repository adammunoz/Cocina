require 'gconf2'

module Conf
  CLIENT = GConf::Client.default
  
  def client
    return CLIENT
  end
end
