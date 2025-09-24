class SumOfMultiples
  attr_reader :factors
  def initialize(*factors)
    @factors = factors.reject{ |f| f==0 }
  end

  def to(number)
    return 0 if number == 0
    list = Set.new()
    factors.each do |factor|
      multiple, i = 0, 1
      while multiple < number
        multiple = factor * i
        list.add(multiple) if multiple < number
        i+=1
      end
    end
    list.sum
  end
end