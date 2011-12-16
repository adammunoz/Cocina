require 'rubygems'
require 'gtk2'

class Table < Gtk::Table
  #Represents an order to display in the form of a table
  ROWS = 1
  COLUMNS = 3
  
  def initialize
    super(ROWS,COLUMNS)
    setup
  end
  
  private
  def setup
    modify_bg Gtk::STATE_NORMAL , Gdk::Color::parse('white')
  end
  
end