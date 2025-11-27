class Series
  def initialize(series)
    raise ArgumentError, "Slice size must be positive" if series.length <= 0
    @series = series.chars
  end

  def slices(num)
    raise ArgumentError, "Slice size is too big" if num > @series.length
    @series.each_cons(num).map(&:join)
  end
end