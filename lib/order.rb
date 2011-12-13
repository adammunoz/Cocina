require 'lib/orderContent'

class Order
  @table = 0
  @contents = OrderContent.new
  
  def add_product(product)
    @contents.add(product)
  end
  
end