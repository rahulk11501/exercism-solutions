module Acronym
  def self.abbreviate(text)
    text.scan(/[A-Za-z']+/)
        .map { |word| word[0].upcase }
        .join
  end
end
