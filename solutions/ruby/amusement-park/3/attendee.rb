class Attendee
  # @return [Integer] The height of the attendee
  attr_accessor :height

  # @return [String, nil] The issued pass id, if any
  attr_accessor :pass_id

  def initialize(height, pass_id: nil)
    @height = height
    @pass_id = pass_id
  end

  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  def revoke_pass!
    @pass_id = nil
  end
end
