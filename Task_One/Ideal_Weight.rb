 frozen_string_literal: true

class CalculateIdealWeight
  class AttributeError < StandardError; end
  SUBTRACTOR = 110

  def initialize
    puts 'Enter Your Name: '
    @name = 'asd'.chomp
    puts 'Enter Your Height: '
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
    if ideal_weight.positive?
      puts "#{@name} Your optimal weight is #{@ideal_weight}"
    else
      puts "#{@name} Your weight is already optimal"
    end
  end

  def ideal_weight
    @ideal_weight ||= @height.to_f - SUBTRACTOR
  end

  def validate
    raise AttributeError, 'please enter your name' if @name.empty?

    raise AttributeError, "#{@name.capitalize}, Height must be numbers" if @height.match(/\D/)

    raise AttributeError, "#{@name.capitalize}, height must not be nill" if @height.to_s.empty?
  end
end

puts CalculateIdealWeight.new.call


