require_relative 'coin'
require_relative 'product'


class Machine

  attr_accessor :product, :credit

  def initialize(args)
    @product = args
    @credit = 0
    @accepted_coins = [Coin.new(name: '1cents_a', value: 0.01, diameter: 19, thickness: 1, mass: 2.5),
      Coin.new(name: '1cents_b', value: 0.01, diameter: 19, thickness: 1, mass: 3),
      Coin.new(name: '5cents', value: 0.05, diameter: 21, thickness: 1, mass: 3),
      Coin.new(name: '10cents', value: 0.10, diameter: 18, thickness: 1.25, mass: 2),
      Coin.new(name: '25cents_a', value: 0.25, diameter: 19, thickness: 1.5, mass: 2),
      Coin.new(name: '25cents_b', value: 0.25, diameter: 19, thickness: 1.5, mass: 3)]
  end

  def add_credit(coin)
    @coin = coin
    @accepted_coins.each do |accoin|
      if @coin.diameter == accoin.diameter && @coin.thickness == accoin.thickness && @coin.mass == accoin.mass
        @credit += coin.value
      end
    end
  end

  def buy(product)
    product_index = product
    if @credit >= @product[product_index].price && @product[product_index].quantity > 0
      puts "Please pick your item!"
      @product[product_index].quantity -= 1
      extra_credit = @credit - @product[product_index].price
      puts "Please pick your extra credit of $ #{extra_credit} !"
      @credit = 0
    end
    if @credit < @product[product_index].price
      puts "You do not have enough credit!"
    end
    if @product[product_index].quantity < 1
      puts "Item sold out. Please pick your credit of $ #{@credit} !"
      @credit = 0
    end
  end


end
