class Increments
  INCREMENT_CONST = 5
  
    def create_array
      array = []
      (10..100).step(INCREMENT_CONST) do |i|
        array << i
      end
      array
    end
  end
  
  puts Increments.new.create_array