class Transpose
  def self.transpose(input)
    return "" if input == ""

    rows = input.split("\n")
    max_len = rows.map(&:length).max
    result_lines = []

    (0...max_len).each do |col|
      # find the last row index that has a real character at this column
      last_row_with_char = nil
      (rows.length - 1).downto(0) do |r|
        if col < rows[r].length
          last_row_with_char = r
          break
        end
      end

      # build the transposed line using only rows up to last_row_with_char
      if last_row_with_char.nil?
        result_lines << ""
      else
        line = ""
        (0..last_row_with_char).each do |r|
          # safe indexing: if character exists use it, else treat as space
          line << (rows[r][col] || " ")
        end
        result_lines << line
      end
    end

    result_lines.join("\n")
  end
end
