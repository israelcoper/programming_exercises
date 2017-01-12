require_relative 'constants.rb'
require_relative 'item.rb'
require_relative 'shopping_cart.rb'

promo_code = 'I<3AMAYSIM'

# Scenario 1
item1 = Item.new ProductCatalogue[0], 3
item2 = Item.new ProductCatalogue[2], 1

cart1 = ShoppingCart.new PricingRules
cart1.add item1
cart1.add item2

puts "Scenario 1"
puts "$#{cart1.total.round(2)}"
puts cart1.items.map {|x| "#{x.quantity} x #{x.product[:name]}"}

print "\n"

# Scenario 2
item3 = Item.new ProductCatalogue[0], 2
item4 = Item.new ProductCatalogue[2], 4

cart2 = ShoppingCart.new PricingRules
cart2.add item3
cart2.add item4

puts "Scenario 2"
puts "$#{cart2.total.round(2)}"
puts cart2.items.map {|x| "#{x.quantity} x #{x.product[:name]}"}

print "\n"

# Scenario 3
item5 = Item.new ProductCatalogue[0], 1
item6 = Item.new ProductCatalogue[1], 2

cart3 = ShoppingCart.new PricingRules
cart3.add item5
cart3.add item6

puts "Scenario 3"
puts "$#{cart3.total.round(2)}"
puts cart3.items.map {|x| "#{x.quantity} x #{x.product[:name]}"}

print "\n"

# Scenario 4
item7 = Item.new ProductCatalogue[0], 1
item8 = Item.new ProductCatalogue[3], 1

cart4 = ShoppingCart.new PricingRules
cart4.add item7, promo_code
cart4.add item8, promo_code

puts "Scenario 4"
puts "$#{cart4.total.round(2)}"
puts cart4.items.map {|x| "#{x.quantity} x #{x.product[:name]}"}

