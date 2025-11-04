require "prime"

class Prime
  def self.nth(n)
    raise ArgumentError, "n must be a positive integer" unless n.is_a?(Integer) && n > 0
    Prime.first(n).last
  end
end
