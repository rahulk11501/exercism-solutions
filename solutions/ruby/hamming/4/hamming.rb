module Hamming
  def self.compute(a, b)
    raise ArgumentError, "Strings must be of equal length" \
    unless a.size == b.size

    (0...a.length).count { |i| a[i] != b[i] }
  end
end
