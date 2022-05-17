# frozen_string_literal: true

# find missing number in array
class NumbersArray
  class AttributeError < StandardError; end
  ARRAY_TEMPLATE = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].freeze
  SIZE = 9
  BIG_ARRAY_ERROR_COMMENT = 'array length is more then 9 element'
  ARGUMENT_ERROR_COMMENT = 'input must be numbers'
  EMPTY_ERROR_COMMENT = 'input must not be nill'
  ARRAY_ELEMENT_ERROR_COMMENT = 'every number in array must be between 1 and 10'
  REGEX_NUMBER = /\D/.freeze
  MAX_NUMBER = 10
  MIN_NUMBER = 1

  def initialize(numbers)
    @numbers = numbers
  end

  def call
    validate
    find_missing_number
  rescue AttributeError => e
    e.message
  end

  private

  def find_missing_number
    (ARRAY_TEMPLATE - @numbers).join.to_i
  end

  def validate
    is_integer = @numbers.all? { |num| num.is_a? Integer }

    raise AttributeError, ARGUMENT_ERROR_COMMENT unless is_integer

    raise AttributeError, BIG_ARRAY_ERROR_COMMENT if @numbers.size > SIZE

    raise AttributeError, ARRAY_ELEMENT_ERROR_COMMENT unless find_missing_number.between?(MIN_NUMBER, MAX_NUMBER)
  end
end


