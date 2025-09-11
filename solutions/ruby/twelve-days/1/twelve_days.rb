class TwelveDays
  ORDINALS = %w[first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth].freeze

  GIFTS = [
    "a Partridge in a Pear Tree.",
    "two Turtle Doves,",
    "three French Hens,",
    "four Calling Birds,",
    "five Gold Rings,",
    "six Geese-a-Laying,",
    "seven Swans-a-Swimming,",
    "eight Maids-a-Milking,",
    "nine Ladies Dancing,",
    "ten Lords-a-Leaping,",
    "eleven Pipers Piping,",
    "twelve Drummers Drumming,"
  ].freeze

  def self.song
    verses.join("\n\n") + "\n"
  end

  def self.verses
    (1..12).map { |d| verse(d) }
  end

  def self.verse(day)
    "On the #{ORDINALS[day - 1]} day of Christmas my true love gave to me: #{gifts_for(day)}"
  end

  def self.gifts_for(day)
    parts = GIFTS.first(day).reverse
    parts[-1] = "and #{parts[-1]}" if day > 1
    parts.join(" ")
  end
end
