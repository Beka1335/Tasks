# frozen_string_literal: true

# qwe
class PrefixTreeNode
  attr_reader   :value, :next
  attr_accessor :is_end, :children, :word

  def initialize(value)
    @value = value
    @word  = false
    @next  = []
    @children = Array.new(26)
  end
end
