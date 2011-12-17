require 'rubygems'
require 'gtk2'
require 'gui/table'
require 'net/main_client'
require 'lib/order_parser'
require 'logger'

class App
  include OrderParser
  @orders_client
  attr_reader :log
  def initialize
    #starts logger
    @log = Logger.new('log/cocina.log')
    
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
    log.info "Program started"
    @main_window.show_all
    Gtk.main
  end
  
  def start_network(host)
    log.info "Network started"
    @orders_client = MainClient.new(host)
    @orders_client.wait_for_msgs() do |msg|
      result_hash = parse msg
      add_order result_hash[:product], result_hash[:table_num] if result_hash != nil
    end
    
  end
  
  def add_order(product_name,table_num)
    log.info "Adding order...#{product_name} : table_num #{table_num}"
    orderTable = Table.new(table_num)
    orderTable.add_product(product_name)
    @main_box.pack_start orderTable.frame, false, false, 0
  end
  
end
