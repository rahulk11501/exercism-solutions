class AssemblyLine
  PRODUCTION_RATE = 221
  attr_reader :speed
  def initialize(speed)
    raise ArgumentError, "Invalid speed" unless speed.between?(1,10)
    @speed = speed
  end

  def production_rate_per_hour
  success = case speed
            when 1..4 then 1.0
            when 5..8 then 0.9
            when 9    then 0.8
            when 10   then 0.77
            else 0
            end

  speed * PRODUCTION_RATE  * success
end


  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
end
