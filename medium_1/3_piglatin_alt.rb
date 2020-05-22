class PigLatin
  
  def self.translate(phrase)
    phrase.split.map { |w| translate_word(w) }.join(' ')
  end

  private

  def self.translate_word(word)
    if begins_with_vowel_sound?(word)
      word + 'ay'
    else
      consonant_sound, rest_of_word = parse_for_consonant(word)
      rest_of_word + consonant_sound + 'ay'
    end
  end
  
  def self.begins_with_vowel_sound?(word)
    word.match(/\A[aeiou]|[xy][^aeiou]/)
  end

  def self.parse_for_consonant(word)
    consonant_split = /\A([^aeiou]*qu|[^aeiou]+)([aeiou].*)\z/.match(word)
    [consonant_split[1], consonant_split[2]]
  end
end
