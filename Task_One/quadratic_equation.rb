

class Quadratic
	class AttributeError < StandardError; end
	CONST = [2,4]

	def initialize
		print "Enter First Side: "
    first = gets.chomp
    print "Enter second Side: "
    second = gets.chomp
    print "Enter third Side: "
		third = gets.chomp
		@first = first
		@second = second
		@third =  third
  end

	def call
		validate
		equation
  rescue AttributeError => error
    	warn error
  end

	private
	
	def equation
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
		@second.to_f ** CONST.first - CONST.last * @first.to_f * @third.to_f
	end

	def find_root(disc, operation)
		-@second.to_f.send(operation, Math.sqrt(disc)) / (CONST.first * @first.to_f)
	end

	def validate
    if @first.match(/\D/) || @second.match(/\D/) || @third.match(/\D/)
      raise AttributeError, "sides must be numbers"
    elsif @first.empty? || @second.empty? || @third.empty?
      raise AttributeError, "sides must not be nill"
    elsif @first.to_f.negative? || @second.to_f.negative? || @third.to_f.negative?
     raise AttributeError, "Every side have to be positive Number !!!"
    else
      return
    end
  end
end
 
 puts Quadratic.new.call


 