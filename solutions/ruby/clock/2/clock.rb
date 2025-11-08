class Clock
  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

  def initialize(hour: 0, minute: 0)
    @total_minutes = (hour * MINUTES_PER_HOUR + minute) % MINUTES_PER_DAY
  end

  def to_s
    hour, minute = total_minutes.divmod(MINUTES_PER_HOUR)
    format('%02d:%02d', hour, minute)
  end

  def +(other)
    self.class.new(minute: total_minutes + other.total_minutes)
  end

  def -(other)
    self.class.new(minute: total_minutes - other.total_minutes)
  end

  def ==(other)
    other.is_a?(self.class) && total_minutes == other.total_minutes
  end

  protected

  attr_reader :total_minutes
end
