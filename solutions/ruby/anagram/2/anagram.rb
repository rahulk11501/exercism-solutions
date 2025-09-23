class Anagram
  attr_reader :main_word

  def initialize(word)
    @main_word = word.downcase
    @main_map = char_count(@main_word)
  end

  def match(words)
    words
      .reject { |word| word.downcase == main_word }
      .select { |word| char_count(word.downcase) == @main_map }
  end

  private

  def char_count(word)
    word.chars.tally
  end
end
