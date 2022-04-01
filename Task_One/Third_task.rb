TWO_DEGREES = 2

class Triangle 

  def sides(first, second, third)
    @first, @second, @third = [first, second, third].sort 
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
    @first + @second < @third
  end
 
  def is_phitagorean?
    @third ** TWO_DEGREES == @first ** TWO_DEGREES + @second ** TWO_DEGREES 
  end

  def is_isosceles?
    @first == @second || @first == @third || @second == @third
  end

  def is_equilateral? 
    @second == @first && @second == @third 
  end

  def check_errors
     unless (@first.positive?) && (@second.positive? ) && (@third.positive? ) 
      raise ArgumentError.new('Every side have to be positive Number !!!') 
    end 
  end

end

 first = gets.chomp.to_f
 second = gets.chomp.to_f
 third = gets.chomp.to_f
 
 puts Triangle.new.sides(first, second, third)
