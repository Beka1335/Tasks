TWO_DEGREES = 2

class Triangle 

  def sides(side_one, side_two, side_three)
    @side_one, @side_two, @side_three = [side_one, side_two, side_three].sort 
    check_errors 
    triangle_types
  end

  def triangle_types 
  case 
  when is_triangle? 
    'The is not a Triangle'
  when is_phitagorean? && is_isosceles? 
    'The Triangle is Rectungular and isosceles' 
  when is_equilateral? && is_isosceles? 
    'The Triangle is equilateral and isosceles' 
  when is_isosceles? 
    'The Triangle is isosceles' 
  when is_phitagorean? 
    'The Triangle is Rectungular'  
  else 
    'The is just Triangle'
    end 
  end

  def is_triangle? 
    @side_one + @side_two < @side_three
  end
 
  def is_phitagorean?
    @side_three ** TWO_DEGREES == @side_one ** TWO_DEGREES + @side_two ** TWO_DEGREES 
  end

  def is_isosceles?
    @side_one == @side_two || @side_one == @side_three || @side_two == @side_three
  end

  def is_equilateral? 
    @side_two == @side_one && @side_two == @side_three 
  end

  def check_errors
     unless (@side_one.positive?) && (@side_two.positive? ) && (@side_three.positive? ) 
      raise ArgumentError.new('Every side have to be positive Number !!!') 
    end 
  end

end

 side_one = gets.chomp.to_f
 side_two = gets.chomp.to_f
 side_three = gets.chomp.to_f
 
 puts Triangle.new.sides(side_one, side_two, side_three)