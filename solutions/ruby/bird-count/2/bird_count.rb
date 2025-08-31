class BirdCount
  attr_reader :yesterday, :total, :busy_days, :day_without_birds

  def initialize(birds_per_day)
    @yesterday = birds_per_day[-2]
    @total = birds_per_day.sum
    @busy_days = birds_per_day.count { |b| b >= 5 }
    @day_without_birds = birds_per_day.any? { |b| b == 0 }
  end

  def self.last_week
    [0, 2, 5, 3, 7, 8, 4]
  end

  def day_without_birds?
    day_without_birds
  end
end
