module Transpose
  def self.transpose(s)
    lines     = s.split("\n")
    max_width = lines.map(&:size).max

    padded = lines.map { |line| line.ljust(max_width, "\0") }
    matrix = padded.map(&:chars)

    matrix
      .transpose
      .map { |col| col.join.sub(/\0+$/, '').tr("\0", ' ') }
      .join("\n")
  end
end
