module Blackjack
  CARD_VALUES = {
    "ace"   => 11,
    "two"   => 2,
    "three" => 3,
    "four"  => 4,
    "five"  => 5,
    "six"   => 6,
    "seven" => 7,
    "eight" => 8,
    "nine"  => 9,
    "ten"   => 10,
    "jack"  => 10,
    "queen" => 10,
    "king"  => 10
  }.freeze

  HIGH_CARDS = %w[ace king queen jack ten].freeze

  def self.parse_card(card)
    CARD_VALUES.fetch(card.downcase, 0)
  end

  def self.card_value_sum(card1, card2)
    parse_card(card1) + parse_card(card2)
  end

  def self.card_range(card1, card2)
    case card_value_sum(card1, card2)
    when 21 then "blackjack"
    when 17..20 then "high"
    when 12..16 then "mid"
    else "low"
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    return "P" if card1 == "ace" && card2 == "ace"
    dealer_value = parse_card(dealer_card)
    
    case card_range(card1, card2)
    when "blackjack" then HIGH_CARDS.include?(dealer_card) ? "S" : "W"
    when "high" then "S"
    when "mid" then dealer_value >= 7 ? "H" : "S"
    else "H" # "low"
    end
  end
end

