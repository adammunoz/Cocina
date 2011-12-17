require 'gui/main'


class TestMain
  
  def initialize
    @app = App.new
  end
  
  def test_run
    @app.add_order('Test Product','0')
    @app.run
  end
end

TestMain.new().test_run