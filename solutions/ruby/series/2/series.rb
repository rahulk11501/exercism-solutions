class Series
  attr_reader :digits
  def initialize(digits)
    raise ArgumentError if digits.empty?
    @digits = digits
  end

  def slices(portion)
    raise ArgumentError if portion < 1 || portion > digits.length
    (0..digits.length - portion).map { |i| digits[i, portion] }
  end
end
