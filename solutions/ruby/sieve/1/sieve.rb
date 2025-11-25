class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    return [] if @limit < 2

    numbers = (2..@limit).to_a
    primes = []

    until numbers.empty?
      prime = numbers.shift
      primes << prime
      numbers.reject! { |n| n % prime == 0 }
    end

    primes
  end
end