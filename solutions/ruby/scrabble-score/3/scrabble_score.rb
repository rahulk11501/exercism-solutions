class Scrabble
  LETTER_SCORES = {
    1  => %w[A E I O U L N R S T],
    2  => %w[D G],
    3  => %w[B C M P],
    4  => %w[F H V W Y],
    5  => %w[K],
    8  => %w[J X],
    10 => %w[Q Z]
  }.flat_map { |score, letters| letters.product([score]) }.to_h.freeze

  attr_reader :word

  def initialize(word)
    @word = word.to_s.upcase
  end

  def score
    word.chars.sum { |letter| LETTER_SCORES.fetch(letter, 0) }
  end
end