require 'gui/main'
#todo Manage configuration settings with GCONF
HOST = '192.168.1.11'

begin
  @app = App.new
  Thread.new {@app.start_network(HOST)}
  @app.run
ensure
  @app.clean
end


