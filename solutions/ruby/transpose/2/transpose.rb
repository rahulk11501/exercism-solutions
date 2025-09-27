class Transpose
  def self.transpose(s)
    lines = s.split("\n")
    max_width = lines.map(&:size).max

    matrix = lines.map { |x| x.ljust(max_width, "\0") }.map(&:chars)

    matrix
      .transpose
      .map { |col| col.join.gsub(/\0+$/, "").gsub("\0", " ") }
      .join("\n")
  end
end
