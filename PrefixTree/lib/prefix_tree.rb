# frozen_string_literal: true

require_relative '../lib/prefix_tree_node'
require_relative '../lib/csv_controller'

require 'csv'

# qwer
class PrefixTree
  attr_accessor :root

  def initialize
    @root = PrefixTreeNode.new('')
    @dictionay = []
    @csv_dictionary = Csv.new
  end

  def add_word(word)
    @dictionay << word
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
    prefix = '' if prefix.nil?
    listlist(prefix)
  end

  def delete_word(word)
    @dictionay.delete(word)
    delete_recursively(word, 0, root)
  end

  def write_csv
    @csv_dictionary.save_to_csv(list)
  end

  def read_csv
    qwe = @csv_dictionary.read_from_csv
    qwe.each { |_, word| add_word(word.to_s) }
  end

  private

  def listlist(prefix)
    result = []
    @dictionay.each { |word| result << word if word.start_with?(prefix) }
    result.length.zero? ? 'word is not in dictionary' : result
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

  def delete_each(current, char, should_delete_ref)
    if should_delete_ref
      current.children.delete(char)
      current.children.length.zero?
    end
  end

  def delete_recursively(word, index, root)
    current = root

    in_trie?(word, index, current)

    char = word[index]
    return false unless current.children.include?(char)

    next_node = current.children[char]
    should_delete_ref = delete_recursively(word, index + 1, next_node)

    delete_each(current, char, should_delete_ref)
    false
  end

  def in_trie?(word, index, current)
    if index == word.length
      return false unless current.is_end

      current.is_end = false
      current.children.length.zero?
    end
  end
end

trie = PrefixTree.new
#trie.read_csv
 trie.add_word('cat')
 trie.add_word('caps')
 trie.add_word('cattle')
puts trie.find_word('caps')
puts trie.includes?('ca')
# trie.delete_word('cattle')
# trie.write_csv
puts trie.list()
