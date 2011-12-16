require 'test/unit'
require 'gui/main'
require 'gui/table'

class TestMain < Test::Unit::TestCase
  
  def setup
    @app = App.new
  end
  
  def test_run
    test_table = Table.new
    test_table.add_product('Test_product')
    @app.add_table(test_table)
    @app.run
  end
end