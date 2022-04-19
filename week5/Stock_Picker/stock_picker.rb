# frozen_string_literal: true

class StockPicker
  class AttributeError < StandardError; end
  ZERO = 0
  EMPTY_ERROR_MESSAGE = 'input valus must not be nill'
  NEGATIVE_ERROR_MESSAGE = 'input valus must be positive number'

  def initialize(stock = nil)
    @stock = stock
  end

  def call
    validate
    find_best_index
  rescue AttributeError => e
    e.message
  end

  private

  def find_best_index
    left_index = min_index = right_index = difference = ZERO
    @stock.each.with_index do |item, index|
      if item - @stock[min_index] > difference
        right_index = index
        left_index = min_index
        difference = item - @stock[min_index]
      end
      min_index = index if item < @stock[min_index]
    end
    [left_index, right_index]
  end

  def validate
    raise AttributeError, EMPTY_ERROR_MESSAGE if @stock.to_a.empty?
    return if @stock.all? { |item| (item.is_a? Numeric) && !item.negative? }

    raise AttributeError, NEGATIVE_ERROR_MESSAGE
  end
end
