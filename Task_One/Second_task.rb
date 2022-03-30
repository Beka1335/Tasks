AREA = 2

class Triangle

  def area(base, height)
    puts (base * height) / AREA
  end
end

base = gets.chomp.to_f
height = gets.chomp.to_f

puts Triangle.new.area(base, height) 