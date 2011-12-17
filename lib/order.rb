require 'lib/orderContent'
require 'cocina_log'

class OrdersPool
  def initialize
    @pool = []
  end
  
  def << (pair)
    @pool << pair
  end
  
  def out
    @pool.shift
  end
  
  def [] (key)
    @pool.each do |pair|
      return pair[1] if pair[0] == key
    end
    return nil
  end
end

class Order
  include CocinaLog

  attr_reader :contents
  def initialize
    @table = 0
    @contents = OrderContent.new
  end
 
  def add_product(product_name)
    log.debug "Order.add_product #{product_name}"
    return @contents.add(product_name)
  end
  
end