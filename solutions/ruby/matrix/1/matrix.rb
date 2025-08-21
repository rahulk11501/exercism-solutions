class Matrix
  attr_reader :matrix, :col
  def initialize(input)
    @matrix = []
    input.split("\n").each do |row|
      @matrix << row.split(" ").map(&:to_i)
    end
  end

  def row(num)
    matrix[num-1]
  end

  def column(num)
    matrix.map { |row| row[num - 1] }
  end
end