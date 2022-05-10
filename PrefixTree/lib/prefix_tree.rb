# frozen_string_literal: true

require_relative '../lib/prefix_tree_node'

class PrefixTree
  def initialize
    @root = PrefixTreeNode.new('')
    @stack        = []
    @words        = []
    @prefix_stack = []
  end

  def add_word(word)
    letters = word.chars
    base = @root
    letters.each { |letter| base = add_letter(letter, base.next) }

    base.word = true
  end

  def find_word(word)
    letters = word.chars
    base = @root

    found_word = letters.all? { |letter| base = find_character(letter, base.next) }

    yield found_word if block_given?

    base ? base.word : false
  end

  def includes?(word)
    find_word(word) { |found| return found }
  end

  def list(prefix = nil)
    if prefix == nil
    else
      @stack        << find_words_with_prefix(prefix)
      @prefix_stack << prefix.chars.take(prefix.size - 1)
      return [] unless @stack.first
  
      add_in_list
      @words
    end
  end

  def delete(word)
    letters = word.chars
    base = @root

    found_word = letters.all? { |letter| base = find_character(letter, base.next) }

    base.word = false
  end

  private

  def add_in_list
    until @stack.empty?
      node = @stack.pop
      @prefix_stack.pop and next if node == :guard_node

      @prefix_stack << node.value
      @stack        << :guard_node
      @words << @prefix_stack.join if node.word
      node.next.each { |n| @stack << n }
    end
  end

  def add_letter(character, trie)
    trie.find { |n| n.value == character } || add_node(character, trie)
  end

  def add_node(character, trie)
    PrefixTreeNode.new(character).tap { |new_node| trie << new_node }
  end

  def find_words_with_prefix(word)
    letters = word.chars
    base = @root
    letters.all? { |letter| base = find_character(letter, base.next) }
    base
  end

  def find_character(character, trie)
    trie.find { |n| n.value == character }
  end
end

trie = PrefixTree.new
trie.add_word('cat')
trie.add_word('caps')
trie.add_word('cattle')
puts trie.find_word('ca')
puts trie.includes?('ca')
trie.delete('cattle')
p trie.list('cat')
