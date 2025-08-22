class SimpleCalculator
  ALLOWED_OPERATIONS = %w[+ / *]
  ALLOWED_TYPES = [Integer, Float]

  class UnsupportedOperation < ArgumentError
    def initialize(message = 'Unsupported operation. Allowed operations are: %s' % ALLOWED_OPERATIONS.join(', '))
      super(message)
    end
  end

  attr_accessor :first_operand, :second_operand, :operation

  def initialize(first_operand, second_operand, operation)
    @first_operand = first_operand
    @second_operand = second_operand
    @operation = operation
    validate
  end

  def self.calculate(first_operand, second_operand, operation)
    new(first_operand, second_operand, operation).calculate
  end

  def calculate
    result = first_operand.public_send(operation, second_operand)
    "%s %s %s = %s" % [first_operand, operation, second_operand, result]
  rescue ZeroDivisionError
    'Division by zero is not allowed.'
  end

  private

  def validate
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)

    unless ALLOWED_TYPES.include?(first_operand.class) &&
           ALLOWED_TYPES.include?(second_operand.class)
      raise ArgumentError, 'Invalid operand types. Allowed operands are: %s' % ALLOWED_TYPES.map(&:to_s).join(' and ')
    end
  end
end