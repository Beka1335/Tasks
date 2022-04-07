class CountCharactersInArrayElement
  PROGRAMING_LANGUAGES = ['Ruby', 'Python', 'Java', '.NET', 'HTML', 'JavaScript']
  
  def initialize
    @array = PROGRAMING_LANGUAGES
  end

  def call
    find_character_number
  end

  private

  def find_character_number
    @array.inject({}) do |hash, element| 
      hash[element] = element.size
      hash
    end
  end
end

programing_language = CountCharactersInArrayElement.new
puts programing_language.call
