require 'rubygems'
require 'gtk2'
require 'gui/table'

class App
  def initialize
    #Create the main window and pack its widgets
    @main_window = Gtk::Window.new
    
    #Mainbox
    @main_box = Gtk::VBox.new(false, 10)
    
    
    #Setup the main window
    @main_window.set_border_width 20
    @main_window.add @main_box
    @main_window.maximize
    
  end
  
  def run
    @main_window.show_all
    Gtk.main
  end
  
  def add_order(product_name,table_num)
    orderTable = Table.new(table_num)
    orderTable.add_product(product_name)
    @main_box.pack_start orderTable.frame, false, false, 0
  end
  
end
