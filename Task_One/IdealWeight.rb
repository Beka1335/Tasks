class CalculateIdealWeight
  
  class AttributeError < StandardError; end
  SUBTRACTOR = 110
  EDGE = 0

  def initialize
    print "Enter Your Name: "
    name = gets.chomp
    print "Enter Your Height: "
    height = gets.chomp

    @name = name
    @height = height
  end

  def call
    validate
    ideal_weight
  rescue AttributeError => error
    warn error
  end

  def ideal_weight
    if @height.to_f - SUBTRACTOR <= EDGE
      print "#{@name} Your weight is already optimal"
    else
      optimal_weight = @height.to_f - OPTIMAL 
      print "#{@name} Your optimal weight is #{optimal_weight}"
    end
  end

  def validate
    if @name.empty?
      raise AttributeError, "please enter your name"
    elsif @height.match(/\D/)
      raise AttributeError, "#{@name.capitalize}, Height must be numbers"
    elsif @height.empty?
      raise AttributeError, "#{@name.capitalize}, height must not be nill"
    else @height.to_f <= EDGE
      raise AttributeError, "#{@name.capitalize}, height must be positive number"
    end
  end
end

calculateidealweight = CalculateIdealWeight.new

puts calculateidealweight.call



