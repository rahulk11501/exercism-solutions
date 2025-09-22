class SpiralMatrix
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def matrix
    output = Array.new(num) { Array.new(num, 0) }

    left, top = 0, 0
    right, bottom = num - 1, num - 1
    i = 1

    while left <= right && top <= bottom
      # Top row
      (left..right).each do |col|
        output[top][col] = i
        i += 1
      end
      top += 1

      # Right column
      (top..bottom).each do |row|
        output[row][right] = i
        i += 1
      end
      right -= 1

      # Bottom row
      if top <= bottom
        right.downto(left).each do |col|
          output[bottom][col] = i
          i += 1
        end
        bottom -= 1
      end

      # Left column
      if left <= right
        bottom.downto(top).each do |row|
          output[row][left] = i
          i += 1
        end
        left += 1
      end
    end

    output
  end
end
