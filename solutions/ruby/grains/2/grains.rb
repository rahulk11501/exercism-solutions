class Grains
  def self.square(num)
    raise ArgumentError unless (1..64).include?(num)
    2 ** (num-1)
  end

  def self.total
    (2**64) - 1
  end
end
