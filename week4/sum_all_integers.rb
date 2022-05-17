# frozen_string_literal: true

# Sum of digits
class SumAllIntegers
  class AttributeError < StandardError; end
  ARGUMENTERRORCOMENT = 'input must be numbers'
  EMPTYERRORCOMENT = 'input must not be nill'
  REGEXNUMBER = /\D/.freeze

  def initialize
    puts 'enter first number'
    @first_number = gets.chomp
    puts 'enter last number'
    @last_number = gets.chomp
  end

  def call
    validate(@first_number)
    validate(@last_number)
    sum_all_integers(@first_number, @last_number)
  rescue AttributeError => e
    puts e
  end

  private

  def sum_all_integers(first_number, last_number)
    first, second = [first_number.to_i, last_number.to_i].sort
    summarized_integer = (first..second).sum
    puts summarized_integer
  end

  def validate(number)
    raise AttributeError, ARGUMENTERRORCOMENT if number.match(REGEXNUMBER)

    raise AttributeError, EMPTYERRORCOMENT if number.to_s.empty?
  end
end

SumAllIntegers.new.call
