class NotMovieClubMemberError < RuntimeError
  DEFAULT_MESSAGE = "No popcorn for non club members".freeze

  def initialize(msg = DEFAULT_MESSAGE) = super
end

class Moviegoer
  attr_reader :age, :member

  def initialize(age, member: false)
    @age, @member = age , !!member
  end

  def ticket_price = age >= 60 ? 10 : 15

  def watch_scary_movie? = age >= 18

  # Popcorn is 🍿
  def claim_free_popcorn!
    raise NotMovieClubMemberError unless member
    '🍿'
  end
end
