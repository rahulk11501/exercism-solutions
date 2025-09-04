class Luhn
  def self.valid?(digits)
    digits = digits.delete(' ')
    return false unless digits.match?(/\A\d+\z/)
    return false if digits.size <= 1
    sum = 0
    digits.chars.reverse.each_with_index do |num, ix|
      num = num.to_i
      num *= 2 if (ix+1) % 2 == 0
      num -= 9 if num > 9
      sum += num
    end
    return sum % 10 == 0
  end
end