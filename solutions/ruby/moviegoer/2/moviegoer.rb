# This is a custom exception that you can use in your code
class NotMovieClubMemberError < RuntimeError
  def initialize(msg = "No popcorn for non club members")
    super
  end
end

class Moviegoer
  attr_accessor :age, :member
  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price = age >= 60 ? 10 : 15

  def watch_scary_movie? = age >= 18

  # Popcorn is 🍿
  def claim_free_popcorn!
    raise NotMovieClubMemberError unless member
    '🍿' if member
  end
end
