module Chess
  RANKS = (1..8).freeze
  FILES = ('A'..'H').freeze

  module_function

  def valid_square?(rank, file)
    RANKS.include?(rank) && FILES.include?(file)
  end

  def nickname(first_name, last_name)
    "%s%s" % [first_name[0, 2].upcase, last_name[-2, 2].upcase]
  end

  def move_message(first_name, last_name, square)
    nick = nickname(first_name, last_name)
    sq = square.upcase
    file, rank = sq[0], sq[1].to_i

    return "%s moved to %s" % [nick, sq] if valid_square?(rank, file)

    "%s attempted to move to %s, but that is not a valid square" % [nick, sq]
  end
end
