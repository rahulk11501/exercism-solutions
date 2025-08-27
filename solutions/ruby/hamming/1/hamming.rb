class Hamming
  def self.compute(a,b)
    a, b, count = a.chars, b.chars, 0
    raise ArgumentError if a.size != b.size
    a.each_with_index.count { |v, i| v != b[i] }
  end
end