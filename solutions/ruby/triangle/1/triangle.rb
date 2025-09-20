class Triangle
  attr_reader :is_valid, :uniq_sides

  def initialize(sides)
    a, b, c = sides
    @is_valid = (
      !sides.any?{|s| s==0 } && 
      a + b >= c &&
      b + c >= a &&
      a + c >= b
    )
    @uniq_sides = sides.uniq.count
  end

  def equilateral?
    is_valid && uniq_sides == 1
  end

  def isosceles?
    is_valid && uniq_sides <= 2
  end

  def scalene?
    is_valid && uniq_sides == 3
  end
end