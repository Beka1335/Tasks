# frozen_string_literal: true

class CalculateFactorial
  class AttributeError < StandardError; end
  ZERO_FACTOTIAL = 1
  DECREASE_ONE = -1
  ARGUMENT_ERROR_COMENT = 'input must be numbers'
  EMPTY_ERROR_COMENT = 'input must not be nill'
  REGEX_NUMBER = /\D/.freeze

  def initialize
    puts 'please enter number'
    @number = gets.chomp
  end

  def call
    validate
    count_factorial(@number.to_i)
  rescue IntegerError => e
    warn e
  end

  private

  def count_factorial(number)
    if number.zero?
      ZERO_FACTOTIAL
    else
      count_factorial(number + DECREASE_ONE) * number
    end
  end

  def validate
    raise AttributeError, ARGUMENT_ERROR_COMENT if @number.match(REGEX_NUMBER)

    raise AttributeError, EMPTY_ERROR_COMENT if @number.to_s.empty?
  end
end

puts CalculateFactorial.new.call
