# frozen_string_literal: true

class BubbleSort
  class AttributeError < StandardError; end
  EMPTY_ERROR_MESSAGE = 'input valus must not be nill'
  ERROR_MESSAGE = 'input array have to contain same class elements'
  ONE = 1

  def initialize(array = nil)
    @array = array
  end

  def call
    validate
    bubble_sort(@array)
  rescue AttributeError => e
    e.message
  end

  private

  def bubble_sort(array)
    array_length = array.size
    return array if array_length <= ONE
    loop do
      swapped = false
      (array_length - ONE).times do |elemet|
        if array[elemet] > array[elemet + ONE]
          array[elemet], array[elemet + ONE] = array[elemet + ONE], array[elemet]
          swapped = true
        end
      end
      break unless swapped
    end
    array
  end

  def validate
    raise AttributeError, EMPTY_ERROR_MESSAGE if @array.to_a.empty?
    return if @array.all? { |element| element.class == @array.first.class }

    raise AttributeError, ERROR_MESSAGE
  end
end


