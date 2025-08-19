=begin
Write your code for the 'Acronym' exercise in this file. Make the tests in
`acronym_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/acronym` directory.
=end
class Acronym
  def self.abbreviate(text)
    result = ""
    text.split(/[^a-zA-Z]/).each do |t|
      result += t[0].upcase unless t.empty?
    end
    result
  end   
end