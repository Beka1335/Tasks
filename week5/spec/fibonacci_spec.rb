require '../week5/Sum_all_even_numbers_in_Fibonacci/sum_even_numbers_in_fibonacci'
require 'faker'

FIBONACCI_RANGE = 1..100
TESTS_NUMBER = 100
ARGUMENT_ERROR_COMENT = 'input value must be positive number'
EMPTY_ERROR_COMENT = 'input must not be empty'
MIN_ALPHA = 10
NUMBER = 1000



describe SumEvenNumbersInFibonacci do
  TESTS_NUMBER.times do
    negative_faker = Faker::Number.negative
    string_faker = Faker::Alphanumeric.alphanumeric(number: NUMBER, min_alpha: MIN_ALPHA)
    faker = Faker::Number.within(range: FIBONACCI_RANGE)

    it "negative number error" do
      expect(SumEvenNumbersInFibonacci.new(negative_faker.to_s).call).eql? ARGUMENT_ERROR_COMENT 
    end

    it "alfabet input error" do 
      expect(SumEvenNumbersInFibonacci.new(string_faker).call).eql? ARGUMENT_ERROR_COMENT
    end

    it "nill" do 
      expect(SumEvenNumbersInFibonacci.new((nil).to_s).call).eql? EMPTY_ERROR_COMENT
    end
  end
end