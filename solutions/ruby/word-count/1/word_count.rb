class Phrase
  attr_reader :words, :word_count

  def initialize(words)
    @words = words
    @word_count = words.downcase.split(/[ ,\n]+/).map{|a| a.gsub(/[^a-z0-9'\w]|^'|'$/, '')}.reject(&:empty?).tally
  end
end
