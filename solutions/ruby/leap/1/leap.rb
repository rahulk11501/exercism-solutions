=begin
Write your code for the 'Leap' exercise in this file. Make the tests in
`leap_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/leap` directory.
=end

class Year
  def self.leap?(year)
    return year % 400 == 0 if year % 100 == 0
    return year % 4 == 0 
  end
end
