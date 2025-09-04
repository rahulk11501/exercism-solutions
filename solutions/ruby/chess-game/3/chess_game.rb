module Chess
  RANKS = 1..8
  FILES = 'A'..'H'

  def self.valid_square?(rank, file)
    RANKS.to_a.include?(rank) && FILES.to_a.include?(file)
  end

  def self.nickname(first_name, last_name)
    (first_name[0..1] + last_name[-2..-1]).upcase
  end

  def self.move_message(first_name, last_name, square)
    n = nickname(first_name, last_name)
    s = square.upcase
    
    if valid_square?(s[1].to_i, s[0]) 
      n + " moved to " + s
    else 
      n + " attempted to move to " + s + ", but that is not a valid square"
    end
  end
end
