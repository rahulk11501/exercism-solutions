module Port
  # @return {Symbol}
  IDENTIFIER = :PALE

  # @param {String} city
  # @return {Symbol} First 4 letters of city as uppercase symbol
  def self.get_identifier(city)
    city[0..3].upcase.to_sym
  end

  # @param {Symbol,String} ship_identifier
  # @return {Symbol} Terminal :A or :B depending on ship type
  def self.get_terminal(ship_identifier)
    %w[OIL GAS].any? { |i| ship_identifier.to_s.include?(i) } ? :A : :B
  end
end
