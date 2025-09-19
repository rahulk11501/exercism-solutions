class SpaceAge
  
  ORBITAL_PERIOD = {
    "mercury":	0.2408467,
    "venus":	0.61519726,
    "earth":	1.0,
    "mars":	    1.8808158,
    "jupiter":	11.862615,
    "saturn":	29.447498,
    "uranus":	84.016846,
    "neptune":	164.79132
  }
  
  ONE_EARTH_YEAR = 31_557_600
  
  attr_reader :age
  
  def initialize(age)
    @age = age
  end

  ORBITAL_PERIOD.each do |planet, factor|
    define_method "on_#{planet}" do
      age / (ONE_EARTH_YEAR * factor)
    end
  end
end