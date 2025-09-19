class Pangram
  ALPHABETS = %w[q w e r t y u i o p
  a s d f g h j k l
  z x c v b n m
  ]
  def self.pangram?(sentence)
    sentence = sentence.downcase.gsub(" ", "").chars
    return false if sentence.length < 26
    
    ALPHABETS.each do |letter|
      return false unless sentence.include?(letter)
    end
    return true
  end
end