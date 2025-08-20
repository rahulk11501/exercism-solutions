class SimpleCalculator
  # Create an anonymous class inheriting from StandardError for UnsupportedOperation
  UnsupportedOperation = Class.new(StandardError)

  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  ALLOWED_TYPES = [Integer, Float]

  def self.calculate(first_operand, second_operand, operation)
    # Validate operation
    unless ALLOWED_OPERATIONS.include?(operation)
      raise UnsupportedOperation.new("Invalid operation" ) 
    end

    # Validate types (ensure both operands are Integer or Float)
    unless ALLOWED_TYPES.include?(first_operand.class) &&
           ALLOWED_TYPES.include?(second_operand.class)
      raise ArgumentError.new("Invalid operand types")
    end

    # Check division by zero
    if operation == '/' && second_operand == 0
      raise ZeroDivisionError.new("Division by zero is not allowed.")
    end

    # Perform calculation safely
    result = first_operand.send(operation, second_operand)
    "#{first_operand} #{operation} #{second_operand} = #{result}"

  rescue ZeroDivisionError => e
    e.message
  end
end
