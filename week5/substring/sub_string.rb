# frozen_string_literal: true

class SubString
  class AttributeError < StandardError; end
  ERROR_MESSAGE = 'every input value must be string'

  def initialize(input_word, dictionary)
    @dictionary = dictionary.uniq
    @input_word = input_word
    @words ||= {}
  end

  def call
    check_validate
    create_hash
  rescue AttributeError => e
    e.message
  end

  private

  def create_hash
    @input_word.downcase!
    @dictionary.each do |word|
      if @input_word.include? word
        @words[word] ||= 0
        find_word_numbers(word)
      end
    end
    @words
  end

  def find_word_numbers(word)
    word_size = word.size
    input_word_size = @input_word.size
    (input_word_size - word_size + 1).times do |index|
      @words[word] += 1 if word.eql? @input_word[index, word_size]
    end
  end

  def check_validate
    return if @dictionary.all? { |word| word.is_a? String } && (@input_word.is_a? String)

    raise AttributeError, ERROR_MESSAGE
  end
end
