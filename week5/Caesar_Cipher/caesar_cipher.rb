
# converting string by caesar ciper
class CaesarCiper
  class AttributeError < StandardError; end
  LOWER_ALPHABET = ('a'..'z').to_a
  UPPER_ALPHABET = ('A'..'Z').to_a
  ALPHABET_SIZE = 26
  CIPER_ERROR_MESSEGE = 'ciper number must be integer'

  def initialize(ciper_string, ciper_number)
    @ciper_string = ciper_string
    @ciper_number = ciper_number
  end

  def call
    check_validate
    converting_string(:+)
  rescue AttributeError => e
    e.message
  end

  def unencrypted_text
    unencrypted_answer = converting_string(:-)
  end

  private

  def converting_string(operator)
    @ciper_string.split('').reduce('') do |answer, char|
      answer + if LOWER_ALPHABET.include? char
                 find_new_index(LOWER_ALPHABET, char, operator)
               elsif UPPER_ALPHABET.include? char
                 find_new_index(UPPER_ALPHABET, char, operator)
               else
                 char
               end
    end
  end

  def find_new_index(alfabet, char, operator)
    alfabet[alfabet.index(char).send(operator, @ciper_number.to_i) % ALPHABET_SIZE]
  end

  def check_validate
    return if @ciper_number.to_i.to_s == @ciper_number && !@ciper_number.to_i.negative?

    raise AttributeError, CIPER_ERROR_MESSEGE
  end
end
