require 'test/unit'
require 'lib/orderContent'

class TestOrderContent < Test::Unit::TestCase
  PRODUCT_NAME = 'TestProduct TestOrderContent'
  def setup
    @order_content = OrderContent.new
  end
  
  def test_add
    @order_content.add PRODUCT_NAME
    assert @order_content.exists(PRODUCT_NAME)
  end
  
end

class TestRow < Test::Unit::TestCase
  
  def setup
    @product = Product.new 'test_product'
    @row = Row.new @product
  end
  
  def test_inc_qty
    @row.inc_qty
    assert_equal(2,@row.qty)
  end
  
end