module ArmstrongNumbers
  def self.include?(number)
    length = number.to_s.length
    number.to_s.chars.map{ |n| n.to_i**length }.sum == number
  end
end
