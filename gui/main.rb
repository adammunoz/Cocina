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
  
  def add_table(table)
    @main_box.pack_start_defaults table
  end
  
end
