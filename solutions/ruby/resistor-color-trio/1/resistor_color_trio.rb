class ResistorColorTrio
  CODING = {
    "black" => 0,
    "brown" => 1,
    "red" => 2,
    "orange" => 3,
    "yellow" => 4,
    "green" => 5,
    "blue" => 6,
    "violet" => 7,
    "grey" => 8,
    "white" => 9
  }

  SI_UNIT = {
    3 => 'kiloohms',
    6 => 'megaohms',
    9 => 'gigaohms'
  }

  attr_accessor :resistance, :divisor, :si_unit
  
  def initialize(colors)
    unit_place = 10 ** CODING[colors[2]]
    
    @resistance = (
      CODING[colors[0]].to_s + CODING[colors[1]].to_s
    ).to_i * unit_place

    @divisor = get_divisor(CODING[colors[2]])   
    @si_unit = get_si_units(CODING[colors[2]])    
  end

  def label
    "Resistor value: #{resistance/divisor} #{si_unit}"
  end

  private
  def get_si_units(third)
    return "gigaohms" if third == 9
    return "megaohms" if third >= 6 && third < 9
    return "kiloohms" if third >= 2 && third < 6
    return "ohms" if third >= 0 && third < 2
  end    

  def get_divisor(third)
    return 10 ** 9 if third == 9
    return 10 ** 6 if third >= 6 && third < 9
    return 10 ** 3 if third >= 2 && third < 6
    return 1 if third >= 0 && third < 2
  end
end  