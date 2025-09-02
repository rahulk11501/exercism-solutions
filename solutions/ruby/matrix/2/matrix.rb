class Matrix
  attr_reader :matrix, :col
  def initialize(input)
    @matrix = input.split("\n").map do |row|
      row.split(" ").map(&:to_i)
    end
  end

  def row(num)
    matrix[num-1]
  end

  def column(num)
    matrix.map { |row| row[num - 1] }
  end
end