class PhoneNumber
  FINAL_PATTERN = /^[2-9]\d\d[2-9]\d\d\d\d\d\d$/
  VALID_LENGTH = 10
  def self.clean(number)
    number = number
              .scan(/\d/)
              .join
              .sub(/\A[01]/, '')
    
    return nil unless number =~ FINAL_PATTERN
    number.length == VALID_LENGTH ? number : nil
  end
end