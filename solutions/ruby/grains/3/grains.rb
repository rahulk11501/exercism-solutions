module Grains
  MAX_SQUARE = 64
  BASE = 2

  def self.square(num)
    raise ArgumentError, "square must be between 1 and #{MAX_SQUARE}" \
      unless (1..MAX_SQUARE).include?(num)

    BASE**(num - 1)
  end

  def self.total = BASE**MAX_SQUARE - 1
end
