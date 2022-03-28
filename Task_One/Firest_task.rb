class IdealWeight
    def ideal_wright(name,height)
        if height.to_i-110 <= 0
           print "#{name} Your weight is already optimal"
        else
           optimal_weight = height.to_i - 110 
            print "#{name} Your optimal weight is #{optimal_weight}"
        end
    end
end

idealweight = IdealWeight.new

name = gets.chomp
height = gets.chomp

puts idealweight.ideal_wright(name, height)