module Blackjack
  def self.parse_card(card)
    values = {
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
    }

    values.fetch(card.downcase) { 0 } # still returns 0 if invalid
  end

  def self.card_range(card1, card2)
    val = parse_card(card1) + parse_card(card2)
    return "blackjack" if val == 21
    return "high" if (17..20).include?(val)
    return "mid"  if (12..16).include?(val)
    return "low"  if val <= 11
  end

  def self.first_turn(card1, card2, dealer_card)
    total = parse_card(card1) + parse_card(card2)
    range = card_range(card1, card2)

    dealer_face = dealer_card
    dealer_value = parse_card(dealer_card)

    case
    when card1 == "ace" && card2 == "ace"
      "P"
    when range == "blackjack"
      high_cards = ['ace', 'king', 'queen', 'jack', 'ten']
      high_cards.include?(dealer_face) ? 'S' : 'W'
    when range == "high"
      'S'
    when range == "mid"
      dealer_value >= 7 ? 'H' : 'S'
    when range == "low"
      'H'
    end
  end
end
