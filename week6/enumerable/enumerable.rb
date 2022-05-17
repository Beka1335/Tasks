# frozen_string_literal: true

module Enumerable
  def my_each(&block)
    return enum_for unless block_given?

    array = is_a?(Range) ? to_a : self

    array.each(&block)
    array
  end

  def my_each_with_index
    if block_given?
      size = self.size
      size.times do |index|
        yield([self[index], index])
      end
      self
    end
  end

  def my_select
    return enum_for unless block_given?

    selected = []
    my_each { |item| selected << item if yield(item) }
    selected
  end

  def my_all?
    my_each { |element| return false unless yield(element) }
    true
  end

  def my_any?
    my_each { |item| return true if yield(item) }
    false
  end

  def my_none?(&block)
    !my_any?(&block)
  end

  def my_count(number = nil)
    array = is_a?(Range) ? to_a : self

    return array.length unless block_given? || number

    true_elements = []
    if number
      array.my_each { |item| true_elements << item if item == number }
    else
      array.my_each { |item| true_elements << item if yield(item) }
    end
    true_elements.length
  end

  def my_map
    answer = []
    if block_given?
      my_each { |element| answer << yield(element) }
      answer
    end
  end

  def my_inject(start_value, &block)
    if block_given?
      value = start_value
      my_each { |element| value = block.call(value, element) }
      value
    end
  end

  def multilply_els
    my_inject(:*)
  end
end
