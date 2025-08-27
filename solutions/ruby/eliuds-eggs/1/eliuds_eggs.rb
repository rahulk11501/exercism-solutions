class EliudsEggs
  def self.egg_count(num)
    num.to_s(2).chars.count('1')
  end
end