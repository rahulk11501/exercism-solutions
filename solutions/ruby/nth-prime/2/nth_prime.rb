require "prime"
class Prime
  def nth(num)
    Prime.first(num).last or raise ArgumentError
  end
end