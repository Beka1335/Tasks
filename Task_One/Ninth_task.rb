require 'date'

class Days
  def initialize(year, month, day)
    @year, @month, @day = year, month, day
    check_errors
  end

  def calculate
    Date.new(@year, @month, @day).yday
  end

  def check_errors
    if  is_zero? 
      raise ArgumentError.new('year, month and day have to be more then 0')
    end
  end

  def is_zero?
    @year.zero? || @month.zero? || @day.zero?
  end
end
  
puts "Enter year"
year = gets.chomp.to_i
puts "Enter month"
month = gets.chomp.to_i
puts "Enter day"
day = gets.chomp.to_i

puts "#{day}/#{month}/#{year}"
day = Days.new(year, month, day)
puts day.calculate