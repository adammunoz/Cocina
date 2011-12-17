require 'logger'

module CocinaLog
  LOG = Logger.new('log/cocina.log')
  
  def log
    return LOG
  end
  
end