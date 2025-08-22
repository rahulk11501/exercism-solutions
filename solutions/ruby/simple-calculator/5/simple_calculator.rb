class SimpleCalculator
  ALLOWED_OPERATIONS = %w[+ / *]
  ALLOWED_TYPES = [Integer, Float]

  class UnsupportedOperation < ArgumentError
    def initialize(message = 'Unsupported operation. Allowed operations are: %s' % ALLOWED_OPERATIONS.join(', '))
      super(message)
    end
  end

  attr_accessor :op_1, :op_2, :opn

  def initialize(op_1, op_2, opn)
    @op_1 = op_1
    @op_2 = op_2
    @opn = opn
    validate
  end

  def self.calculate(op_1, op_2, opn)
    new(op_1, op_2, opn).calculate
  end

  def calculate
    result = op_1.public_send(opn, op_2)
    "%s %s %s = %s" % [op_1, opn, op_2, result]
  rescue ZeroDivisionError
    'Division by zero is not allowed.'
  end

  private

  def validate
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(opn)

    unless ALLOWED_TYPES.include?(op_1.class) &&
           ALLOWED_TYPES.include?(op_2.class)
      raise ArgumentError, 'Invalid operand types. Allowed operands are: %s' % ALLOWED_TYPES.map(&:to_s).join(' and ')
    end
  end
end