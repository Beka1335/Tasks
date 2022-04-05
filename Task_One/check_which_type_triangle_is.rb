

class Triangle 
  class AttributeError < StandardError; end
  TWO_DEGREES = 2

  def initialize
    print "Enter First Side: "
    first = gets.chomp
    print "Enter second Side: "
    second = gets.chomp
    print "Enter third Side: "
    third = gets.chomp
    @first, @second, @third = [first, second, third].sort 
  end

  def call
    validate 
    triangle_types
  rescue AttributeError => error
    warn error
  end

  private

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

  def validate
    if @first.match(/\D/) || @second.match(/\D/) || @third.match(/\D/)
      raise AttributeError, "sides must be numbers"
    elsif @first.empty? || @second.empty? || @third.empty?
      raise AttributeError, "sides must not be nill"
    elsif @first.to_f.positive? || @second.to_f.positive? || @third.to_f.positive?
      raise AttributeError, "Every side have to be positive Number !!!"
    else
      return
    end
  end
end

puts Triangle.new.call


