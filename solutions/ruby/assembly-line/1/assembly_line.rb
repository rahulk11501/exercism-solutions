class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
  success = case
            when @speed >= 1 && @speed <= 4 then 1.0
            when @speed >= 5 && @speed <= 8 then 0.9
            when @speed == 9                then 0.8
            when @speed == 10               then 0.77
            else 0
            end

  @speed * 221 * success
end


  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
end
