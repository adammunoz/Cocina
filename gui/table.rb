require 'rubygems'
require 'gtk2'
require 'lib/order'

class Table < Gtk::VBox
  #Represents an order to display in the form of a table
  SPACING = 10
  
  def initialize
    super(false,SPACING)
    @order = Order.new
  end
  
  def add_product(product_name)
    @order.add_product(product_name)
    update_view
  end
  
  private
  
  def update_view
    clear
    @order.contents().each do |row|
      add_row row
    end
  end
  
  def add_row(row)
    pack_start_defaults TableRow.new(row)
  end
  
  def clear
    each do |child|
      remove child
    end
  end
  
end

class TableRow < Gtk::HBox
  SPACING = 20
  def initialize(row)
    super false, SPACING
    pack_start_defaults TableCell.new(row.qty)
    pack_start_defaults TableCell.new(row.product)
  end
end

class TableCell < Gtk::Label
  COLOR = '#FFFFFF'
  def initialize(text)
    super 'not set'
    set_markup "<span background='#{COLOR}'>#{text.to_s}</span>"
  end
end