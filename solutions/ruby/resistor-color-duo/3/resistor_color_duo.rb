class ResistorColorDuo
  COLOR_CODE = {
        "black": 0,
        "brown": 1,
        "red": 2,
        "orange": 3,
        "yellow": 4,
        "green": 5,
        "blue": 6,
        "violet": 7,
        "grey": 8,
        "white": 9
    }
  
  def self.value(colors)
    tens = COLOR_CODE[colors[0].to_sym] * 10
    ones = COLOR_CODE[colors[1].to_sym]
    
    tens + ones
  end
end