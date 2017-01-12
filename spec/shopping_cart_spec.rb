require "constants"
require "item"
require "shopping_cart"

describe ShoppingCart do

  context "constants" do
    describe "PROMO_CODE" do
      it "returns the valid promo code" do
        expect(ShoppingCart::PROMO_CODE).to eq('I<3AMAYSIM')
      end
    end
  end

  context "instance methods" do
    let(:cart) { ShoppingCart.new PricingRules }
    let(:item1) { Item.new ProductCatalogue[0], 3 }
    let(:item2) { Item.new ProductCatalogue[2], 1 }

    before :each do
      cart.add item1
      cart.add item2, ShoppingCart::PROMO_CODE
    end

    describe "add" do
      it "insert new item to @items" do
        item3 = Item.new ProductCatalogue[2], 4
        expect(cart.add(item3)).to match_array [item1, item2, item3]
      end
    end

    describe "total" do
      it "returns the expected cart total" do
        expect(cart.total.round(2)).to eq 90.21
      end
    end

    describe "items" do
      it "returns the expected cart items" do
        expect(cart.items).to match_array [item1, item2]
      end
    end
  end

end
