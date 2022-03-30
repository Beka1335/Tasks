class Letters
  CONT = 96
  VOUEL = "aeiou"

  def initialize 
    vowel = {}
  end

  def create_vowel
    VOUEL.each_char do |i|
      vowel[i] = i.ord - CONT
    end
    vowel
  end
end


p Letters.new.create_vowel