class Grains
  def self.square(num)
    raise ArgumentError unless (1..64).include?(num)
    output = 1
    (num-1).times do 
      output += output
    end
    return output
  end

  def self.total
    output, grain = 1, 1
    63.times do 
      grain += grain
      output += grain
    end
    return output
  end
end
