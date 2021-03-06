class OrderContent
  def initialize
    @rows = []
  end
 
  def add(product_name)
    #It adds a product to the contents incrementing quantity if it already exists
    #It returns the row added (or whose quantity has incremented)
    product = Product.new(product_name) 
    _exists product do |row| 
      if row
        row.inc_qty 
      else 
        row = Row.new(product)
        @rows << row
      end
      return row
    end
  end
  
  def remove(product_name)
    product = Product.new(product_name)
    _exists product do |row|
      if row
        row.dec_qty if row.qty > 1
        @rows.delete(row) if row.qty == 1
        return true
      else
        return false
      end
    end
  end
  
  def exists(product_name)
    _exists(Product.new(product_name)) {|row| return row }
  end
  
  def each
    @rows.each do |row|
      yield row
    end
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
  
  def to_s
    return @name
  end
  
end