class Attendee
  attr_accessor :height, :pass_id

  def initialize(height, pass_id: nil)
    @height, @pass_id = height, pass_id
  end

  def issue_pass!(id) = @pass_id = id
  def revoke_pass!    = @pass_id = nil
end
