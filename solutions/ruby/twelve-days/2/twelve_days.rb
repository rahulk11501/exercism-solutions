class TwelveDays
  ORDINALS = %w[
    first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth
  ].freeze

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

  class << self
    def song
      verses.join("\n\n") + "\n"
    end

    def verses
      (1..12).map { |day| verse(day) }
    end

    def verse(day)
      "On the #{ORDINALS.fetch(day - 1)} day of Christmas my true love gave to me: #{gifts_for(day)}"
    end

    private

    def gifts_for(day)
      gifts = GIFTS.first(day).reverse
      gifts[-1] = "and #{gifts[-1]}" if day > 1
      gifts.join(" ")
    end
  end
end