# frozen_string_literal: true


class PrefixTreeNode
  attr_reader   :value, :next
  attr_accessor :word

  def initialize(value)
    @value = value
    @word  = false
    @next  = []
  end
end



