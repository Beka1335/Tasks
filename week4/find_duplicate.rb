# frozen_string_literal: true

# find duplicate in array
class FindDuplicateInArray
  class AttributeError < StandardError; end

  def initialize
    @array = []
  end

  def call
    fill_array
    find_dublicates
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

  def find_dublicates
    @array.select { |number| @array.count(number) > 1 }.uniq
  end

  def validate(number)
    raise AttributeError, 'input must be numbers' if number.match(/\D/)

    raise AttributeError, 'input must not be nill' if number.to_s.empty?
  end
end

p FindDuplicateInArray.new.call
