

class Find_the_longest_word
  PROGRAMING_LANGUAGES =  ['Ruby', 'Python', 'Java', '.NET', 'HTML', 'JavaScript']
  def initialize
    @array = PROGRAMING_LANGUAGES
  end

  def call
    find_the_longest_word
  end

  private

  def find_the_longest_word
    @array.max_by(&:length)
  end
end

arr = Find_the_longest_word.new
puts arr.call


