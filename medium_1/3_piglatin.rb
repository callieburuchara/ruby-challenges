require 'pry'

class PigLatin
  def self.translate(input)
    all_words = input.split

    all_words.map! do |word|
      all_word_checks(word)
    end.join(' ')
  end

  def self.all_word_checks(word)
    return vowel_first(word) if !!vowel_first(word)
    return three_letter(word) if !!three_letter(word)
    return two_letter(word) if !!two_letter(word)
    return qu_after_first(word) if !!qu_after_first(word)
    #return word_with_x(word) if !!word_with_x(word)
    return word_with_y(word) if !!word_with_y(word)
    return simple_consonant(word)
  end

  private

  def self.vowel?(letter)
    letter =~ /[aeiou]/i
  end

#   def consonant?(letter)
#     letter =~ /[b-df-hj-np-tv-z]/i
#   end

  def self.three_letter(word)
    return false unless ['thr', 'sch'].any? {|w| word.start_with?(w)}
    if word.start_with?('thr')
      word.delete_prefix('thr') << 'thray'
    else
      word.delete_prefix('sch') << 'schay'
    end
  end

  def self.two_letter(word)
    return false unless ['ch', 'qu', 'th'].any? {|w| word.start_with?(w)}
    if word.start_with?('ch')
      word.delete_prefix('ch') << 'chay'
    elsif word.start_with?('qu')
      word.delete_prefix('qu') << 'quay'
    else
      word.delete_prefix('th') << 'thay'
    end
  end

  def self.qu_after_first(word)
    return false unless word[1,2] == 'qu'
    three_letters = word.chars.shift(3).join
    word.delete_prefix(three_letters) << three_letters + 'ay'
  end

  def self.vowel_first(word)
    return false unless vowel?(word[0])
    word + 'ay'   
  end

  def self.simple_consonant(word)
    return false unless !vowel?(word[0])
    first = word.chars.shift
    word.delete_prefix(first) << first + 'ay'
  end

#   def self.word_with_x(word)
#     return false unless word.start_with?('x')
#     vowel?(word[1]) ?   
#   end
 
  def self.word_with_y(word)
    return false unless word.start_with?('y')
    if vowel?(word[1])
      word = word.chars
      word.shift
      (word << 'yay').join     
    else
      word << 'ay'
    end
  end                       

end


p PigLatin.translate('yttria')
