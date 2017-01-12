class Item
  attr_accessor :product, :quantity, :discount

  def initialize(product, quantity)
    @product = product
    @quantity = quantity
    @discount = 0
  end
end
