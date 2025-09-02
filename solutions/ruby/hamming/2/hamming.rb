class Hamming
  def self.compute(a,b)
    raise ArgumentError if a.size != b.size
    a.chars.zip(b.chars).sum { |x, y| x != y ? 1 : 0 }
  end
end