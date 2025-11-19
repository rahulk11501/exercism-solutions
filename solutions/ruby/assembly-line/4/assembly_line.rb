class AssemblyLine
  PRODUCTION_RATE = 221.freeze
  SUCCESS_RATES = {
    1..4 => 1.0,
    5..8 => 0.9,
    9    => 0.8,
    10   => 0.77
  }.freeze

  def initialize(speed)
    raise ArgumentError, "Invalid speed" unless (1..10).cover?(speed)
    @speed = speed
  end

  def production_rate_per_hour
    @speed * PRODUCTION_RATE * success_rate
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end

  private

  def success_rate
    SUCCESS_RATES.each { |k, v| return v if k === @speed }
    0
  end
end
