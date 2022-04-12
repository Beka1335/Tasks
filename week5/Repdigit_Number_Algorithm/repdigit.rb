# frozen_string_literal: true

class AttributeError < StandardError; end

# Repdigit Number Algorithm
class RepDigit
  ARGUMENT_ERROR_COMENT = 'input value must be positive number'
  EMPTY_ERROR_COMENT = 'input must not be nill'
  REGEX_NUMBER = /\D/.freeze

  def initialize(digit)
    @digit = digit
  end

  def call
    validate_digit
    repdigit?
  rescue AttributeError => e
    warn e
  end

  private

  def validate_digit
    raise AttributeError, ARGUMENT_ERROR_COMENT if @digit.to_s.match(REGEX_NUMBER)

    raise AttributeError, EMPTY_ERROR_COMENT if @digit.to_s.empty?
  end

  def repdigit?
    @digit.to_s.split('').uniq.length == 1
  end
end
