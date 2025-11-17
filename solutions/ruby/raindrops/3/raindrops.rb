class Raindrops
  RULES = {
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  def self.convert(num)
    result = RULES.each_with_object("") do |(factor, sound), acc|
      acc << sound if num % factor == 0
    end
    result.empty? ? num.to_s : result
  end
end
