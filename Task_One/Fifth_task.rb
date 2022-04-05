require 'date'


class Year
  class AttributeError < StandardError; end
  CONST = -1
  #MONTH_DAY_AMOUNT = [28,29,30,31]
 
  def initialize
    puts "Enter Year: "
    year = gets.chomp
    puts "Enter Day"
    day = gets.chomp
    @year = year
    @day = day
    @year_hash = {}
  end
  def call
    validate
    search_month_by_amount_of_days
  rescue AttributeError => error
    warn error
  end
  def search_month_by_amount_of_days
    @year_hash = create_hash

    @year_hash.select { |key, value| puts key if value == @day.to_i }
  end

  def create_hash
    month_array = Date::MONTHNAMES
    (1..12).each do |i|
      @year_hash[month_array[i].to_s] = Date.new(@year.to_i, i, CONST).day
    end
    @year_hash
  end

  def validate
    if @year.match(/\D/) || @day.match(/\D/)
      raise AttributeError, "sides must be numbers"
    elsif @year.empty? || @day.empty?
      raise AttributeError, "sides must not be nill"
    elsif @year.to_f.negative? || @day.to_f.negative?
      raise AttributeError, "Every side have to be positive Number !!!"
    elsif @day.to_i < 28 || @day.to_i > 31
      raise AttributeError, "On the earth no sach month with #{@day} days  "
    else
      return
    end
  end
end

puts Year.new.call


