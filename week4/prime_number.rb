# frozen_string_literal: true

# How Many Prime Numbers Are in a Given Array
class PrimeNumber
  class AttributeError < StandardError; end

  def initialize
    @array = []
  end

  def call
    fill_array
    count_prime_numbers
    sum_prime_numbers
  end

  private

  def fill_array
    loop do
      puts "\n When you end filling array 'stop'"
      print 'Enter Number :  '
      number = gets.chomp
      break if number == 'stop'

      validate(number)
      print @array << number.to_i
    rescue AttributeError => e
      puts e
    end
  end

  def count_prime_numbers
    counted = @array.count { |number| is_prime?(number) }
    puts "there are #{counted} prime numbers"
  end

  def sum_prime_numbers
    summarized_prime = finde_prime_number.sum
    puts "this is sum of prime numbers in this array : #{summarized_prime}"
  end

  def finde_prime_number
    @array.select { |number| is_prime?(number) }
  end

  def is_prime?(number)
    return false if number == 1

    sqrt_number = Math.sqrt(number)
    (2..sqrt_number).each do |divisor|
      return false if (number % divisor).zero?
    end
    true
  end

  def validate(number)
    raise AttributeError, 'input must be numbers' if number.match(/\D/)

    raise AttributeError, 'input must not be nill' if number.to_s.empty?
  end
end

PrimeNumber.new.call


