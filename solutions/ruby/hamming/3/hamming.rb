class Hamming
  def self.compute(a, b)
    raise ArgumentError, "Strings must be of equal length" unless a.size == b.size

    a.chars.zip(b.chars).count { |x, y| x != y }
  end
end
