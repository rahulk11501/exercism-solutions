module PhoneNumber
  FINAL_PATTERN = /^[2-9]\d{2}[2-9]\d{6}$/
  VALID_LENGTH  = 10

  def self.clean(number)
    digits = number.scan(/\d/).join
    digits = digits.sub(/\A[01]/, '')

    return digits if digits.length == VALID_LENGTH && digits =~ FINAL_PATTERN
    nil
  end
end
