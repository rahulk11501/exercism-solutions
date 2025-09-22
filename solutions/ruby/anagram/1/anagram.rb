class Anagram
  attr_reader :main_map, :main_word
  def initialize(word)
    @main_word = word
    @main_map = mapper(word)
  end

  def match(words)
    output = []
    words.reject!{|word| word.downcase == main_word.downcase}
    words.each do |word|
      output << word if mapper(word) == main_map
    end
    output
  end

  private
  def mapper(word)
    map = Hash.new(0)
    word.each_char { |ch| map[ch.downcase]+= 1}
    map
  end
end
