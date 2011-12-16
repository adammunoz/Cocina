require 'rubygems'
require 'gtk2'
require 'gui/table'

#Create the main window and pack its widgets
main_window = Gtk::Window.new

#Mainbox
main_box = Gtk::VBox.new(false, 10)
main_box.pack_start Table.new


#Setup the main window
main_window.set_border_width 20
main_window.add main_box
main_window.show_all
main_window.maximize
Gtk.main