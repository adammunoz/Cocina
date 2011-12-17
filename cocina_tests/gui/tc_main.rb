require 'test/unit'
require 'gui/main'


class TestMain < Test::Unit::TestCase
  
  def setup
    @app = App.new
  end
  
  def test_run
    @app.start_network('192.168.1.11')
    @app.run
  end
end