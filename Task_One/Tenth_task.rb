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
      price = gets.chomp
      puts "Enter product quantity"
      quantity = gets.chomp
      @name = name
      @price = price
      @quantity = quantity
      @purchase[name] = {price: price.to_f, quantity: quantity.to_f}
    end
  end

  def call
    add_in_cart
    validate
    create_amount
    product_quantity
    price_sum
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
      puts "empty cart"
    else
      puts "total amount of all product is #{@amount.values.sum}" 
    end
  end
  def validate
    if @price.match(/\D/) || @quantity.match(/\D/)
      raise AttributeError, "Price and Quantuty must be numbers"
    elsif @price.empty? || @quantity.empty? || @name.empty?
      raise AttributeError, "Price and Quantuty must not be nill"
    elsif @price.to_f.negative? || @quantity.to_f.negative?
      raise AttributeError, "Price and Quantuty have to be positive Number !!!"
    else
      return
    end
  end
end

prc = Purchase.new

 prc.call


