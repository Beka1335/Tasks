class Fibonacci
  def fibonacci(num)
    # Error check
    if num < 0 then
        raise ArgumentError, "The number must be a positive integer"
    end
  
    # Terminating base cases
    return [] if num == 0
    return [0] if num == 1
    return [0,1] if num == 2 
  
    # Recursion
    seq = fibonacci(num - 1) 
  
    # The recursive function
    seq << seq[-2] + seq[-1]
  
    return seq
  end
end

puts Fibonacci.new.fibonacci(100)