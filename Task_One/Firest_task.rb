#Ideal weight. The program asks for name and height and displays the ideal weight using the formula <height> - 110,
#then displays the result to the user by name. If the ideal weight is negative, the line "Your weight is already optimal" is displayed
#Screen reader support enabled.


class IdealWeight
  OPTIMAL = 110
  
  def ideal_wright(name,height)
    if height.to_i - OPTIMAL <= 0
      print "#{name} Your weight is already optimal"
    else
      optimal_weight = height.to_i - OPTIMAL 
      print "#{name} Your optimal weight is #{optimal_weight}"
    end
  end
end

idealweight = IdealWeight.new

name = gets.chomp
height = gets.chomp

puts idealweight.ideal_wright(name, height)