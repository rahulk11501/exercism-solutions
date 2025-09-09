class Lasagna
  EXPECTED_MINUTES_IN_OVEN = 40
  MINUTES_PER_LAYER = 2

  # @param actual_minutes_in_oven [Integer]
  # @return [Integer] Remaining minutes in the oven
  def remaining_minutes_in_oven(actual_minutes_in_oven)
    EXPECTED_MINUTES_IN_OVEN - actual_minutes_in_oven
  end

  # @param layers [Integer]
  # @return [Integer] Time to prepare the given number of layers
  def preparation_time_in_minutes(layers)
    layers * MINUTES_PER_LAYER
  end

  # @param number_of_layers [Integer]
  # @param actual_minutes_in_oven [Integer]
  # @return [Integer] Total time spent cooking and preparing
  def total_time_in_minutes(number_of_layers:, actual_minutes_in_oven:)
    preparation_time_in_minutes(number_of_layers) + actual_minutes_in_oven
  end
end
