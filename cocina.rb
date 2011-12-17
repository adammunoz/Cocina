require 'gui/main'
require 'conf/cocina_gconf'

@app = App.new
Thread.new {@app.start_network}
@app.run




