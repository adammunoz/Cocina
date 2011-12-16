require 'test/unit'
require 'gui/main'


class TestMain < Test::Unit::TestCase
  
  def setup
    @app = App.new
  end
  
  def test_run
    @app.add_order('Test Product','0')
    @app.run
  end
end