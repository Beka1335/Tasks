# frozen_string_literal: true

# count how many items are greater than input number
class GraterThen
  class AttributeError < StandardError; end

  def initialize
    @array = []
    puts 'enter the number you want count how many items are greater'
    @number = gets.chomp
  end

  def call
    validate(@number)
    fill_array
    find_grater_then_number
  rescue AttributeError => e
    puts e
  end

  private

  def fill_array
    loop do
      puts "\n When you end filling array enter 'stop'"
      print 'Enter Number :  '
      number = gets.chomp
      break if number == 'stop'

      validate(number)
      print @array << number.to_i
    rescue AttributeError => e
      puts e
    end
  end

  def find_grater_then_number
    counter = @array.count { |number| number > @number.to_i }
    puts "there are #{counter} grater numbers then #{@number}"
  end

  def validate(number)
    raise AttributeError, 'input must be numbers' if number.match(/\D/)

    raise AttributeError, 'input must not be nill' if number.to_s.empty?
  end
end

GraterThen.new.call


