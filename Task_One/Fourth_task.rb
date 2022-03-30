CONST = [2,4]

class Quadratic

	def equation(first_side, second_side, third_side)
		@first_side, @second_side, @third_side = first_side, second_side, third_side

		@disc = find_disc

		if @disc.negative?
			puts "Discriminant is #{@disc}, No Roots"
		else
			first_root = find_root(@disc, "+")
			second_root = find_root(@disc, "-")
			if first_root == second_root
				puts "Discriminant is #{@disc} and Root is #{first_root}"
			else
				puts "Discriminant is #{@disc}, and Roots are #{first_root} and #{second_root}"
			end
		end

	end

	def find_disc
		@second_side ** CONST.first - CONST.last * @first_side * @third_side
	end

	def find_root(disc, operation)
		-@second_side.send(operation, Math.sqrt(disc)) / (CONST.first * @first_side)
	end

end


quadratic = Quadratic.new

first_side = gets.chomp.to_f
second_side = gets.chomp.to_f
third_side = gets.chomp.to_f
 
 quadratic.equation(first_side, second_side, third_side)