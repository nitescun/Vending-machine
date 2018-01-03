require_relative '../machine'
require_relative '../coin'
require_relative '../product'

RSpec.describe Machine do
  let(:product) { [Product.new(name: 'Chocolate', price: 1.00, quantity: 500),
    Product.new(name: "Candy", price: 0.50, quantity: 500)] }
  let(:coin) { [Coin.new(name: '1cents_a', value: 0.01, diameter: 19, thickness: 1, mass: 2.5),
    Coin.new(name: '1cents_b', value: 0.01, diameter: 19, thickness: 1, mass: 3),
    Coin.new(name: '5cents', value: 0.05, diameter: 21, thickness: 1, mass: 3),
    Coin.new(name: '10cents', value: 0.10, diameter: 18, thickness: 1.25, mass: 2),
    Coin.new(name: '25cents_a', value: 0.25, diameter: 19, thickness: 1.5, mass: 2),
    Coin.new(name: '25cents_b', value: 0.25, diameter: 19, thickness: 1.5, mass: 3),
    Coin.new(name: '1euro', value: 1, diameter: 25, thickness: 1.5, mass: 3)]}
  let(:machine) { Machine.new(product)}

  describe 'attributes' do
    it 'has a product' do
      expect(machine.product.length).to eq product.length
    end

    it 'product has a name' do
      expect(machine.product[0].name).to eq 'Chocolate'
      expect(machine.product[1].name).to eq 'Candy'
    end

    it 'product has a price' do
      expect(machine.product[0].price).to eq 1.00
      expect(machine.product[1].price).to eq 0.50
    end

    it 'product has a quantity' do
      expect(machine.product[0].quantity).to eq 500
      expect(machine.product[1].quantity).to eq 500
    end

    it 'coin has a value' do
      expect(coin[0].value).to eq 0.01
      expect(coin[1].value).to eq 0.01
      expect(coin[2].value).to eq 0.05
      expect(coin[3].value).to eq 0.10
      expect(coin[4].value).to eq 0.25
      expect(coin[5].value).to eq 0.25
    end
    it 'coin has a diameter' do
      expect(coin[0].diameter).to eq 19
      expect(coin[1].diameter).to eq 19
      expect(coin[2].diameter).to eq 21
      expect(coin[3].diameter).to eq 18
      expect(coin[4].diameter).to eq 19
      expect(coin[5].diameter).to eq 19
    end
    it 'coin has a thickness' do
      expect(coin[0].thickness).to eq 1
      expect(coin[1].thickness).to eq 1
      expect(coin[2].thickness).to eq 1
      expect(coin[3].thickness).to eq 1.25
      expect(coin[4].thickness).to eq 1.50
      expect(coin[5].thickness).to eq 1.50
    end
  end

  describe 'work with machine' do
    it 'has a credit' do
      expect(machine.credit).to eq 0
    end

    it 'add credit' do
      machine.add_credit(coin[0])
      expect(machine.credit).to eq 0.01
      machine.add_credit(coin[6])
      expect(machine.credit).to eq 0.01
    end

    it 'dispense a product' do
      machine.credit = 2.00
      machine.buy(0)
      expect(machine.product[0].quantity).to eq 499
      machine.credit = 2.00
      machine.buy(1)
      expect(machine.product[1].quantity).to eq 499
    end

    it 'return the excess of the credit after dispense a product' do
      machine.credit = 2.00
      machine.buy(0)
      expect(machine.credit).to eq 0
    end

    it 'return the credit when the product is sold out' do
      machine.credit = 2.00
      machine.product[0].quantity = 0
      machine.buy(0)
      expect(machine.credit).to eq 0
    end
  end

end
