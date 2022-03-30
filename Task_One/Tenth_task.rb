ZERO = 0

class Purchase

  def initialize
    @purchase = {}
    @amount = {}
  end
  
  def add_in_cart
    loop do 
      puts "\n When you end adding product in your cart enter 'stop'"
      puts "\nEnter product name"
      name = gets.chomp
      if name == "stop"
        break
      end
      puts "Enter product price"
      price = gets.chomp.to_f
      puts "Enter product quantity"
      quantity = gets.chomp.to_f
      @purchase[name] = {price: price, quantity: quantity}
    end
  end

  def create_amount
    @purchase.each do |key, value| 
      @amount[key] = value[:price] * value[:quantity]
    end
  end

  def product_quantity
    @amount.each { |key, value| 
      if value == ZERO  
        "no product" 
      else 
        puts "#{key} total amount is #{value}" 
      end}
  end

  def price_sum
    if @amount.values.sum == ZERO
      "empty cart"
    else
      "total amount of all product is #{@amount.values.sum}" 
    end
  end
end

prc = Purchase.new


prc.add_in_cart
prc.create_amount
prc.product_quantity
puts prc.price_sum