# frozen_string_literal: true

require '../week5/Repdigit_Number_Algorithm/repdigit'
require 'faker'

PRODUCT_RANGE = 1..10000
TESTS_NUMBER = 100
MIN_ALPHA = 10
NUMBER = 1000
ARGUMENT_ERROR_COMENT = 'input value must be positive number'

describe RepDigit do 
  TESTS_NUMBER.times do 
    negativ_number = Faker::Number.negative
    product_faker = Faker::Number.within(range:PRODUCT_RANGE)
    string_faker = Faker::Alphanumeric.alphanumeric(number: NUMBER, min_alpha: MIN_ALPHA)
    repdigit_number = Faker::Number.digit.to_s * product_faker
    numbers = Faker::Number.number(digits: 10)

    it "check that number is repdigit number" do 
      expect(RepDigit.new(repdigit_number).call).to equal true
    end
    it "check that number is not repdigit number" do 
      expect(RepDigit.new(numbers).call).to equal false
    end
  
    it "raise error when number is not positive integer" do 
      expect(RepDigit.new(string_faker).call).eql? ARGUMENT_ERROR_COMENT
    end

    it "raise error when number is empty string" do 
      expect(RepDigit.new(negativ_number).call).eql? ARGUMENT_ERROR_COMENT
    end

    it "raise error when number is empty string" do 
      expect(RepDigit.new('').call).eql? ARGUMENT_ERROR_COMENT
    end
  end
end
