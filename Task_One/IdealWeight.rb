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
    calculate_ideal_weight
    ideal_weight
  rescue AttributeError => error
    warn error
  end

  private

  def ideal_weight
    if @optimal_weight <= EDGE
      print "#{@name} Your weight is already optimal"
    else
      print "#{@name} Your optimal weight is #{@optimal_weight}"
    end
  end

  def calculate_ideal_weight
    @optimal_weight = @height.to_f - SUBTRACTOR
  end

  def validate
    if @name.empty?
      raise AttributeError, "please enter your name"
    elsif @height.match(/\D/)
      raise AttributeError, "#{@name.capitalize}, Height must be numbers"
    elsif @height.empty?
      raise AttributeError, "#{@name.capitalize}, height must not be nill"
    elsif @height.to_f <= EDGE
      raise AttributeError, "#{@name.capitalize}, height must be positive number"
    else
      return
    end
  end
end

puts CalculateIdealWeight.new.call


