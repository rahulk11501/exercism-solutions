class Phrase
  attr_reader :words, :word_count

  def initialize(words)
    @words = words.downcase.scan(/\b[\w']+\b/)
    @word_count = @words.tally
  end
end
