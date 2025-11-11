class BirdCount
  attr_reader :birds_per_day

  def initialize(birds_per_day)
    @birds_per_day = birds_per_day
  end

  def yesterday = birds_per_day[-2]

  def total = birds_per_day.sum

  def busy_days = birds_per_day.count { |b| b >= 5 }

  def day_without_birds? = birds_per_day.any?(0)

  def self.last_week = [0, 2, 5, 3, 7, 8, 4]
end
