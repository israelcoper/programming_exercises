class ShoppingCart
  attr_reader :pricing_rules

  PROMO_CODE = 'I<3AMAYSIM'

  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @items = []
  end

  def add(item, promo_code = nil)
    if promo_code == PROMO_CODE
      item.discount += 0.1
    end

    rule = pricing_rules.find {|pr| pr[:code] == item.product[:code]}

    case rule[:code]
    when "ult_small"
      item.discount += rule[:discount] if item.quantity == rule[:count]
    when "ult_medium"
      @items << Item.new(ProductCatalogue[3].merge(price: 0), item.quantity)
    when "ult_large"
      item.discount += rule[:discount] if item.quantity > rule[:count]
    else
    end

    @items << item
  end

  def total
    items.inject(0) do |result, item|
      price = item.product[:price]
      discounted = price - (price * item.discount)
      amount = discounted * item.quantity
      result += amount 
    end
  end

  def items
    @items
  end
end
