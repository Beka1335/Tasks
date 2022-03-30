require 'date'

class Year
  CONST = -1
  def initialize(year)
    @year = year
    @year_hash = {}
  end

  def create_hash
    month_array = Date::MONTHNAMES
    (1..12).each do |i|
      @year_hash[month_array[i].to_s] = Date.new(@year, i, CONST).day
    end
    @year_hash
  end
end

year = gets.chomp.to_i

year_hash = Year.new(year).create_hash

year_hash.select { |key, value| puts key if value == 30 }