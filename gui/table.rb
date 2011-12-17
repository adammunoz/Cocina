require 'rubygems'
require 'gtk2'
require 'lib/order'

class Table
  #Represents an order to display in the form of a table
  SPACING = 10
  attr_reader :frame
  
  def initialize (table_num)
    @frame = Gtk::Frame.new
    @frame.set_label_widget FrameTitle.new(table_num)
    @order = Order.new
    @box = Gtk::VBox.new false, SPACING
    @frame.add @box
    
  end
  
  def add_product(product_name)
    @order.add_product(product_name)
    update_view
  end
  
  def remove_product(product_name)
    @order.remove_product(product_name)
    update_view
  end
  
  private
  
  def update_view
    clear
    @order.contents().each do |row|
      add_row row
    end
    @frame.show_all
  end
  
  def add_row(row)
    @box.pack_start TableRow.new(row), true, true, 0
  end
  
  def clear
    @box.each do |child|
      @box.remove child
    end
  end
  
end


class TableRow < Gtk::HBox
  SPACING = 10
  def initialize(row)
    super false, SPACING
    set_border_width SPACING
    pack_start CocinaLabel.new(row.qty), false, false, 0
    pack_start CocinaLabel.new(row.product), false, false, 0
  end
  
  def change_bg(s)
    color = Gdk::Color.parse s
    modify_bg Gtk::STATE_NORMAL, color
  end
end

class CocinaLabel < Gtk::Label
  
  def initialize(text)
    super 'not set'
    my_set_markup text,16, 'yellow','black'
  end
  
  private
  def my_set_markup(text,font_size,bg,fg)
    set_markup "<span font_desc='#{font_size}' background='#{bg}' foreground='#{fg}'>#{text.to_s}</span>"
  end
  
end

class FrameTitle < CocinaLabel
  def initialize(text)
    super text
    my_set_markup text,20, 'black','green'
  end 
end
