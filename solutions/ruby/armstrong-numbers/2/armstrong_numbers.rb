module ArmstrongNumbers
  def self.include?(number)
    length = number.digits.length
    number.digits.sum{ |n| n.to_i**length } == number
  end
end
