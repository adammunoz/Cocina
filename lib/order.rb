require 'lib/orderContent'

class Order
  
  def initialize
    @table = 0
    @contents = OrderContent.new
  end
 
  def add_product(product_name)
    @contents.add(product_name)
  end
  
end