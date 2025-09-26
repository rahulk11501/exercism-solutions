class PhoneNumber
  FINAL_PATTERN = /^[2-9]\d{2}[2-9]\d{6}$/
  VALID_LENGTH = 10
  def self.clean(number)
    number = number
              .scan(/\d/)
              .join
              .sub(/\A[01]/, '')
    
    return number if number.length == VALID_LENGTH && number =~ FINAL_PATTERN
    nil
  end
end