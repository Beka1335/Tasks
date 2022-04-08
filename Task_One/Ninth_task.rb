require 'date'

class Days
  class AttributeError < StandardError; end

  def initialize
    puts "Enter year"
    year = gets.chomp
    puts "Enter month"
    month = gets.chomp
    puts "Enter day"
    day = gets.chomp
    @year = year
    @month = month
    @day = day   
  end

  def call
    validate_date
    calculate
    puts "#{day}/#{month}/#{year}"
  rescue AttributeError => error
    warn error
  end

  def calculate
    Date.new(@year.to_i, @month.to_i, @day.to_i).yday
  end

  def validate_date
    if @year.match(/\D/) || @month.match(/\D/) || @day.match(/\D/)
      raise AttributeError, "year month and day must be numbers"
      elsif @year.empty? || @month.empty? || @day.empty?
        raise AttributeError, "year month and day must not be nill"
      elsif Date.valid_date?(@year, @month, @day) == false
        raise AttributeError, "#{@year.to_i}-#{@month.to_i}-#{@day.to_i} Date is not valid!"
      else
        return
    end
  end

end

puts  Days.new.call


