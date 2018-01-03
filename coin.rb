class Coin

  attr_reader :name, :value, :diameter, :thickness, :mass

  def initialize(args = {})
    @name = args[:name]
    @value = args[:value]
    @diameter = args[:diameter]
    @thickness = args[:thickness]
    @mass = args[:mass]
  end

end
