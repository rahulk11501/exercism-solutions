module SavingsAccount
  def self.interest_rate(b)
    b < 0    ? 3.213 :
    b < 1000 ? 0.500 :
    b < 5000 ? 1.621 : 2.475
  end

  def self.annual_balance_update(b)
    b * (1 + interest_rate(b) / 100.0)
  end

  def self.years_before_desired_balance(c, d)
    y = 0
    while c < d
      c = annual_balance_update(c)
      y += 1
    end
    y
  end
end
