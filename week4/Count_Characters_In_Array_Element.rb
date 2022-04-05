class Count_Characters_In_Array_Element
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

programing_language = Count_Characters_In_Array_Element.new
puts programing_language.call