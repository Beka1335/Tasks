AREA = 2

class Triangle

  def initialize(base, height)
    @base = base
    @height = height
  end

  def calculate_area_of_triangle
    if check_on_zero
      puts (@base * @height) / AREA
    else
      puts "one of the argument is zero"
    end
    
  end

  def check_on_zero
    !(@base.zero? || @height.zero?)
  end
end


puts "Enter triangle base length:"
base = gets.chomp.to_f
puts "Enter triangle height length:"
height = gets.chomp.to_f

triangle = Triangle.new(base, height)
puts triangle.calculate_area_of_triangle