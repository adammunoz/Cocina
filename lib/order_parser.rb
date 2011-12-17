require 'cocina_log'
module OrderParser
  include CocinaLog
  SEPARATOR = '@'
  SYNTAX = ['comanda','borrar']
  
  def parse(s)
    ary = s.split SEPARATOR
    command = ary[0]
    if SYNTAX.include? command
      log.debug "#{command} is allowed syntax"
      return {:op => command, :table_num => ary[1], :product => ary[2]}
    else
      log.debug "#{command} is NOT allowed syntax"
      return nil
    end
  end
  
end