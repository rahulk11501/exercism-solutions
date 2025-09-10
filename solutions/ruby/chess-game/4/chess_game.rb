module Chess
  RANKS = 1..8
  FILES = 'A'..'H'

  def self.valid_square?(rank, file)
    RANKS.include?(rank) && FILES.include?(file)
  end

  def self.nickname(first_name, last_name)
    first_initials = first_name[0, 2].upcase
    last_initials = last_name[-2, 2].upcase
    "%s%s" % [first_initials, last_initials]
  end

  def self.move_message(first_name, last_name, square)
    player_nickname = nickname(first_name, last_name)
    square = square.upcase
    file_letter = square[0]
    rank_number = square[1].to_i

    if valid_square?(rank_number, file_letter)
      "%s moved to %s" % [player_nickname, square]
    else
      "%s attempted to move to %s, but that is not a valid square" % [player_nickname, square]
    end
  end
end
