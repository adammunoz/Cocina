require 'lib/orderContent'
require 'cocina_log'
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