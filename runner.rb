require_relative 'coin'
require_relative 'product'
require_relative 'machine'

product =[Product.new(name: 'Chocolate', price: 1.00, quantity: 500),
  Product.new(name: "Candy", price: 0.50, quantity: 500)]
coin =[Coin.new(name: '1cents_a', value: 0.01, diameter: 19, thickness: 1, mass: 2.5),
  Coin.new(name: '1cents_b', value: 0.01, diameter: 19, thickness: 1, mass: 3),
  Coin.new(name: '5cents', value: 0.05, diameter: 21, thickness: 1, mass: 3),
  Coin.new(name: '10cents', value: 0.10, diameter: 18, thickness: 1.25, mass: 2),
  Coin.new(name: '25cents_a', value: 0.25, diameter: 19, thickness: 1.5, mass: 2),
  Coin.new(name: '25cents_b', value: 0.25, diameter: 19, thickness: 1.5, mass: 3),
  Coin.new(name: '1euro', value: 1, diameter: 25, thickness: 1.5, mass: 3)]
machine  = Machine.new(product)
choise =5
until choise ==4 do
  puts "Credit $#{machine.credit}"
  puts "Select your option then press Enter"
  puts "1: Add credit"
  puts "2: Buy #{product[0].name} for $#{product[0].price}"
  puts "3: Buy #{product[1].name} for $#{product[1].price}"
  puts "4: Exit"
  choise = gets.chomp.to_i
  if choise == 1
    machine.add_credit(coin[rand(7)])
  end
  if choise == 2
    machine.buy(0)
  end
  if choise == 3
    machine.buy(1)
  end
end
