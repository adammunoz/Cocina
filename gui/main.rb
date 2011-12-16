require 'rubygems'
require 'gtk2'

#Create the main window and pack its widgets
main_window = Gtk::Window.new

#Mainbox
main_box = Gtk::VBox.new(false, 10)



#Setup the main window
main_window.add main_box
main_window.show_all
main_window.maximize
Gtk.main