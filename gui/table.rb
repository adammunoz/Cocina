require 'rubygems'
require 'gtk2'
require 'lib/order'

class Table < Gtk::VBox
  #Represents an order to display in the form of a table
  SPACING = 10
  
  def initialize
    super(false,SPACING)
    @order = Order.new
    setup
  end
  
  def add_product(product_name)
    @order.add_product(product_name)
    update_view
  end
  
  private
  def setup
    modify_bg Gtk::STATE_NORMAL , Gdk::Color::parse('white')
  end
  
  def update_view
    clear
    @order.contents().each do |row|
      add_row row
    end
  end
  
  def add_row(row)
    pack_start_defaults Gtk::Label.new('Uninitialized')
  end
  
  def clear
    each do |child|
      remove child
    end
  end
  
end
