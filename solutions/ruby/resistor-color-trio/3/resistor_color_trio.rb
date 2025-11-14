class ResistorColorTrio
  CODING = {
    "black"  => 0, "brown"  => 1, "red"   => 2,
    "orange" => 3, "yellow" => 4, "green" => 5,
    "blue"   => 6, "violet" => 7, "grey"  => 8, "white"  => 9
  }.freeze

  UNITS = [
    { threshold: 9, name: "gigaohms", divisor: 10**9 },
    { threshold: 6, name: "megaohms", divisor: 10**6 },
    { threshold: 2, name: "kiloohms", divisor: 10**3 },
    { threshold: 0, name: "ohms",     divisor: 1 }
  ].freeze

  attr_reader :resistance, :unit_name, :divisor

  def initialize(colors)
    @resistance = calculate_resistance(colors)
    unit        = find_unit(colors[2])
    @unit_name  = unit[:name]
    @divisor    = unit[:divisor]
  end

  def label
    "Resistor value: #{resistance / divisor} #{unit_name}"
  end

  private

  def calculate_resistance(colors)
    first_two  = color_digit(colors[0]).to_s + color_digit(colors[1]).to_s
    multiplier = 10 ** color_digit(colors[2])
    
    first_two.to_i * multiplier
  end

  def find_unit(multiplier_color)
    exponent = color_digit(multiplier_color)
    
    UNITS.find { |u| exponent >= u[:threshold] }
  end

  def color_digit(color)
    CODING.fetch(color) do 
      raise ArgumentError, "Invalid color: #{color}"
    end
  end
end
