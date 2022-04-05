class CalculateTriangleArea
  class AttributeError < StandardError; end
  AREA = [2 , 0]

  def initialize
    puts "Enter triangle base length:"
    base = gets.chomp
    puts "Enter triangle height length:"
    height = gets.chomp
    @base = base
    @height = height
  end

  def call 
    validate
    check_on_zero
    calculate_area_of_triangle
  rescue AttributeError => error
    warn error
  end

  private

  def calculate_area_of_triangle
    if check_on_zero
      puts (@base.to_f * @height.to_f) / AREA.first
    else
      puts "one of the argument is zero"
    end
    
  end

  def check_on_zero
    !(@base.to_f.zero? || @height.to_f.zero?)
  end

  def validate
    if @height.match(/\D/) || @base.match(/\D/)
      raise AttributeError, "Height must be numbers"
    elsif @height.empty? || @base.empty?
      raise AttributeError, "height must not be nill"
    elsif @height.to_f <= AREA.last || @base.to_f <= AREA.last
      raise AttributeError, "height must be positive number"
    else
      return
    end
  end
end

puts CalculateTriangleArea.new.call


