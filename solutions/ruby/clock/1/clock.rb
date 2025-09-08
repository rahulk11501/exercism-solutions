class Clock
  def initialize(hour: 0, minute: 0)
    total_minutes = (hour * 60 + minute) % (24 * 60)
    @hour, @minute = total_minutes.divmod(60)
  end

  def to_s
    format("%02d:%02d", @hour, @minute)
  end

  def +(other)
    Clock.new(hour: @hour + other.hour, minute: @minute + other.minute)
  end

  def -(other)
    Clock.new(hour: @hour - other.hour, minute: @minute - other.minute)
  end

  def ==(other)
    other.is_a?(Clock) && @hour == other.hour && @minute == other.minute
  end

  protected

  attr_reader :hour, :minute
end

