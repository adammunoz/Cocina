require 'gui/main'
@app = App.new
Thread.new {@app.start_network('192.168.1.11')}
@app.run


