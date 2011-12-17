require 'gui/main'

begin
  @app = App.new
  Thread.new {@app.start_network('192.168.1.11')}
  @app.run
ensure
  @app.clean
end


