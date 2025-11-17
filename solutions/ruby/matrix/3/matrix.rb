class Matrix
  attr_reader :matrix

  def initialize(input)
    @matrix = input.lines.map { |row| row.split.map(&:to_i) }
  end

  def row(n)
    matrix[n - 1]
  end

  def column(n)
    matrix.map { |r| r[n - 1] }
  end
end
