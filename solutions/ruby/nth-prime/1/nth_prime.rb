=begin
Write your code for the 'Nth Prime' exercise in this file. Make the tests in
`nth_prime_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/nth-prime` directory.
=end
class Prime
  def self.nth(n)
    raise ArgumentError, "n must be greater than 0" if n <= 0

    count = 0
    num = 1
    while count < n
      num += 1
      count += 1 if prime?(num)
    end
    num
  end

  def self.prime?(num)
    return false if num < 2
    (2..Math.sqrt(num)).none? { |i| num % i == 0 }
  end
end
