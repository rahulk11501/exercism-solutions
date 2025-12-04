class Luhn
  def self.valid?(input)
    digits = sanitize(input)
    return false unless valid_format?(digits)
    return false if digits.size <= 1

    checksum(digits) % 10 == 0
  end

  private

  def self.sanitize(input)
    input.to_s.delete(' ')
  end

  def self.valid_format?(digits)
    digits.match?(/\A\d+\z/)
  end

  def self.checksum(digits)
    digits.chars.reverse.each_with_index.sum do |char, index|
      value = char.to_i
      value = double(value) if index.odd?
      value
    end
  end

  def self.double(num)
    num *= 2
    num > 9 ? num - 9 : num
  end
end