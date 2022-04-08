INCREMENT_CONST = 5
FROM_TEN_TO_HUNDRED = (10..100)

class Increments
  
    def create_array
      array = []
      FROM_TEN_TO_HUNDRED.step(INCREMENT_CONST) do |i|
        array << i
      end
      array
    end
  end
  
  puts Increments.new.create_array