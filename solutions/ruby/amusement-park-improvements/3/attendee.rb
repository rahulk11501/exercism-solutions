class Attendee
  attr_reader :height, :pass_id

  # @param {Integer} height
  # @return {void}
  def initialize(height)
    @height = height
    @pass_id = nil
  end

  # @param {String} pass_id
  # @return {String}
  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  # @return {nil}
  def revoke_pass!
    @pass_id = nil
  end

  # @return {Boolean}
  def has_pass?
    !pass_id.nil?
  end

  # @param {Integer} ride_minimum_height
  # @return {Boolean}
  def fits_ride?(ride_minimum_height)
    height >= ride_minimum_height
  end

  # @param {Integer} ride_minimum_height
  # @return {Boolean}
  def allowed_to_ride?(ride_minimum_height)
    has_pass? && fits_ride?(ride_minimum_height)
  end
end
