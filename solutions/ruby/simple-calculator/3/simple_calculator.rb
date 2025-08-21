module CustomExceptions
  class UnsupportedOperation < StandardError
    def initialize(message='Invalid operation')
      super(message)
    end
  end
end

class SimpleCalculator
  include CustomExceptions
  
  ALLOWED_OPERATIONS = %w[ + / * ]
  ALLOWED_TYPES = [Integer, Float]

  def self.calculate(first_operand, second_operand, operation)
    validate(first_operand, second_operand, operation)

    result = first_operand.public_send(operation, second_operand)
    "#{first_operand} #{operation} #{second_operand} = #{result}"

  rescue ZeroDivisionError => e
    e.message
  end

  private

  def self.validate(first_operand, second_operand, operation)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)
    unless ALLOWED_TYPES.include?(first_operand.class) &&
           ALLOWED_TYPES.include?(second_operand.class)
      raise ArgumentError.new('Invalid operand types')
    end    
    raise ZeroDivisionError.new('Division by zero is not allowed.') if operation == '/' && second_operand == 0
  end
end
