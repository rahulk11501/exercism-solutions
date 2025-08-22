class Series
  attr_reader :series
  def initialize(series)
    raise ArgumentError if series.empty?
    @series = series
  end

  def slices(portion)
    raise ArgumentError if portion < 1 || portion > series.size
    output = []
    length = series.size
    (0..length-portion).each do |i|
      output << series[i..i+portion-1]
    end
    output
  end
end
