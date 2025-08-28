class Isogram
  def self.isogram?(input)
    input = input.downcase.gsub(/[^a-z0-9]/, '').chars
    input.uniq.length == input.length
  end
end