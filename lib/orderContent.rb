class OrderContent
  def initialize
    @rows = []
  end
 
  def add(product)
    #It adds a product to the contents incrementing quantity if it already exists
    #It returns the row added (or whose quantity has incremented) 
    _exists product do |row| 
      if row then row.inc_qty else @rows << Row.new(product)
      end
      return row
    end
  end
  
  def exists(product)
    _exists(product) {|row| return row }
  end
  
  private 
  def _exists(product)
    #if the product exists yields the row where it exists, otherwise yields nill
    @rows.each do |row|
      if row.product == product then yield row end
    end
    yield nil
  end
  
end

class Row
  attr_reader :qty
  attr_reader :product
  
  def initialize(product)
    @qty = 1
    @product = product
  end
  
  def inc_qty()
    @qty+=1
  end
  
end

class Product
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def ==(other_product)
    return @name == other_product.name
  end
  
end