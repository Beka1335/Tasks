# frozen_string_literal: true

class AttributeError < StandardError; end

# calculate sum of even fibonacci numbers before N
class SumEvenNumbersInFibonacci
  ARGUMENT_ERROR_COMENT = 'input value must be positive number'
  EMPTY_ERROR_COMENT = 'input must not be empty'
  REGEX_NUMBER = /\D/.freeze

  def initialize(number)
    @number = number
  end

  def call
    validate
    fibonacci
    fibonacci_number_sum(fibonacci)
  rescue AttributeError => e
    e.message
  end

  private

  def fibonacci
    seq = []
    (0..@number.to_i).each do |number|
      seq << number if number <= 1
      seq << seq[-1] + seq[-2] if number > 1
    end
    seq
  end

  def fibonacci_number_sum(array)
    array.select(&:even?).reduce(:+)
  end

  def validate
    raise AttributeError, ARGUMENT_ERROR_COMENT if @number.to_s.match(REGEX_NUMBER)

    raise AttributeError, EMPTY_ERROR_COMENT if @number.to_s.empty?
  end
end
