module OrderParser
  SEPARATOR = '@'
  ORDER_COMMAND = 'comanda'
  def parse(s)
    ary = s.split SEPARATOR
    if ary[0] != ORDER_COMMAND then
      return nil
    end
  return {:table_num => ary[1], :product => ary[2]}
  end
end