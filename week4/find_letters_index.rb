# frozen_string_literal: true

# find letters index in string
class FindLettersIndex
  class AttributeError < StandardError; end
  REGEXSCANLETTERS = /[^a-z]/.freeze
  COMENTFORERROR = 'The input string should contain only letters'

  def initialize
    puts 'please enter string'
    @letters = gets.chomp
    @letters_hash = {}
  end

  def call
    validate
    find_letters_index
  rescue AttributeError => e
    warn e
  end

  private

  def find_letters_index
    @letters.each_char.with_index do |letter, index|
      @letters_hash[letter] ||= []
      @letters_hash[letter] << index
    end
    @letters_hash
  end

  def validate
    raise AttributeError, COMENTFORERROR unless @letters.scan(REGEXSCANLETTERS)
  end
end

puts FindLettersIndex.new.call
