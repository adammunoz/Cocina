require 'test/unit'
require 'lib/order'


class TestOrder < Test::Unit::TestCase
  PRODUCT_NAME = 'TestProduct TestOrder'
  def setup
    @order = Order.new
  end
  
  def test_add_product
    @order.add_product(PRODUCT_NAME)
  end
end