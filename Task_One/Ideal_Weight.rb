class CalculateIdealWeight
  class AttributeError < StandardError; end
  SUBTRACTOR = 110

  def initialize
    print 'Enter Your Name: '
    @name = 'asd'.chomp
    print 'Enter Your Height: '
    @height = '180'.chomp
  end

  def call
    validate
    ideal_weight
    detect_ideal_weight
  rescue AttributeError => e
    warn e
  end

  private

  def detect_ideal_weight
    if ideal_weight.zero?
      print "#{@name} Your weight is already optimal"
    else
      print "#{@name} Your optimal weight is #{@optimal_weight}"
    end
  end

  def ideal_weight
    @optimal_weight = @height.to_f - SUBTRACTOR
  end

  def validate
      raise AttributeError, 'please enter your name' if @name.empty?
    elsif @height.match(/\D/)
      raise AttributeError, "#{@name.capitalize}, Height must be numbers"
    elsif @height.empty?
      raise AttributeError, "#{@name.capitalize}, height must not be nill"
    end
  end
end

puts CalculateIdealWeight.new.call


