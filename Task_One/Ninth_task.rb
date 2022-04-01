require 'date'

class Days
  def initialize(year, month, day)
    @year, @month, @day = year, month, day
    validate_date(@year, @month, @day)
  end

  def calculate
    Date.new(@year, @month, @day).yday
  end

  def check_errors
    if  is_zero? 
      raise ArgumentError.new('year, month and day have to be more then 0')
    end
  end

  def validate_date(year, month, day)
    if Date.valid_date?(year, month, day) == false
      warn "#{year}-#{month}-#{day} Date is not valid!"
      exit 1
    end
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