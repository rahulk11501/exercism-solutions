class Raindrops
  RULES = {
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  def self.convert(num)
    result = RULES.map { |factor, sound| sound if num % factor == 0 }.compact.join
    result.empty? ? num.to_s : result
  end
end
