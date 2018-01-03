class Product

  attr_accessor :name, :price, :quantity

  def initialize(args = {})
    @name = args[:name]
    @price = args[:price]
    @quantity = args[:quantity]
  end

end
