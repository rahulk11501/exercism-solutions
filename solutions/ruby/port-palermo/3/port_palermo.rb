module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city[0..3].upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    %w[OIL GAS].any? {|i| ship_identifier.to_s.include?(i)} ? :A : :B
  end
end
