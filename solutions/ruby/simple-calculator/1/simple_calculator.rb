class SimpleCalculator
  class UnsupportedOperation < RuntimeError; end

  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  ALLOWED_TYPES = [Integer, Float]

  def self.calculate(first_operand, second_operand, operation)
    # Validate operation
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)

    # Validate types
    unless ALLOWED_TYPES.include?(first_operand.class) &&
           ALLOWED_TYPES.include?(second_operand.class)
      raise ArgumentError
    end

    # Check division by zero
    if operation == '/' && second_operand == 0
      return "Division by zero is not allowed."
    end

    # Perform calculation safely
    result = first_operand.send(operation, second_operand)
    "#{first_operand} #{operation} #{second_operand} = #{result}"
  end
end
