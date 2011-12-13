require 'test/unit'
require 'lib/orderContent'

class TestOrderContent < Test::Unit::TestCase
  
  def setup
    @order_content = OrderContent.new
    @product = Product.new 'test_product'
  end
  
  def test_add
    @order_content.add @product
    assert @order_content.exists(@product)
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