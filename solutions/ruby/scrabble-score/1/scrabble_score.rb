class Scrabble
  SCORES = [
    [%w[A E I O U L N R S T], 1],
    [%w[D G], 2],
    [%w[B C M P], 3],
    [%w[F H V W Y], 4],
    [%w[K], 5],
    [%w[J X], 8],
    [%w[Q Z], 10]
  ]

  TALLY = SCORES.flat_map { |letters, score| letters.product([score]) }.to_h

  attr_reader :word

  def initialize(word)
    @word = word.to_s.upcase
  end

  def score
    word.chars.sum { |letter| TALLY[letter] || 0 }
  end
end
