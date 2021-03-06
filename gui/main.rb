require 'rubygems'
require 'gtk2'
require 'gui/table'
require 'net/main_client'
require 'lib/order_parser'
require 'cocina_log'
require 'conf/cocina_gconf'

class App
  include OrderParser
  include CocinaLog
  include Conf
  @orders_client
  def initialize
 
    #Create the main window and pack its widgets
    @main_window = Gtk::Window.new
    
    #Mainbox
    @main_box = Gtk::VBox.new(false, 10)
    
    
    #Setup the main window
    @main_window.set_border_width 20
    @main_window.add @main_box
    @main_window.maximize 
    
    #Setup window events
    @main_window.signal_connect "destroy" do
      clean
      Gtk.main_quit
    end
    
    @main_window.signal_connect "key_press_event" do
      remove_order
    end
    
    @orders_pool = OrdersPool.new
    
  end
  
  def run
    log.info "Program started"
    @main_window.show_all
    Gtk.main
  end
  
  def start_network
    @orders_client = MainClient.new
    @orders_client.wait_for_msgs() do |msg|
      log.debug "Parsing #{msg}"
      parsed = parse msg
      dispatch parsed if parsed != nil
    end
    log.info "Network started"
  end
  
  def dispatch(p_msg)
    operation =  p_msg[:op]
    if not client["/apps/cocina/listen_tables"].split(',').include?(p_msg[:table_num])
      log.debug "Ignoring #{p_msg[:table_num]}"
      return false
    end  
    if operation == 'comanda'
        #log.debug "Dispatching #{p_msg[:op]} - Executing add_order"
        add_order p_msg[:product], p_msg[:table_num]
    elsif operation == 'borrar'
        log.debug "Dispatching #{p_msg[:op]} - Executing remove_row"
        remove_product p_msg[:product], p_msg[:table_num]
    else
        log.debug "Operation #{p_msg[:op]} cannot be dispatched - We should not have come to this point"
    end
  end  
  
  def add_order(product_name,table_num)
    log.info "Adding order...#{product_name} : table_num #{table_num}"
    orderTable = alloc_table table_num
    orderTable.add_product(product_name)
    @main_box.pack_start orderTable.frame, false, false, 0
  end
  
  def remove_order
    log.info "Removing order..."
    @orders_pool.out
    @main_box.remove @main_box.children[0] 
  end
  
  def remove_product(product_name,table_num)
    log.info "Remove product #{product_name} from #{table_num}"
    orderTable = alloc_table table_num
    orderTable.remove_product product_name
  end
  
  def alloc_table(table_num)
    @orders_pool << ([table_num,Table.new(table_num)]) if not @orders_pool[table_num]
    return @orders_pool[table_num]
  end
  
  def clean
    @orders_client.clean
  end
  
end
