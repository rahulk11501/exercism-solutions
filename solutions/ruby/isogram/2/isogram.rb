module Isogram
  module_function
  def isogram?(input)
    input = input.downcase.scan(/\w/)
    input.uniq.length == input.length
  end
end