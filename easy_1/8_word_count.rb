require 'pry'

class Phrase
  def initialize(phrase)
    @phrase = phrase.split(/,| |\n|(\s\'\w*\'\s)/) # an array
  end

  def word_count
    count = {}
    words = delete_except_alphanum(@phrase).map(&:downcase)

    words.each do |word|
      if count.keys.include?(word)
        count[word] += 1
      else
        count[word] = 1
      end
    end
    count
  end

  def delete_except_alphanum(string)
    string.map do |word|
      word.delete('^a-zA-Z0-9\'')
    end.select {|l| l != ''}
  end
end

phrase = Phrase.new('car : carpet as java : javascript!!&@$%^&')
puts phrase.word_count

=begin
- Problem: I need to allow words to keep their apostrophes when they're
  contractions
  - BUT I need to delete them when they're being used as quotation marks

- So how do I ignore them when they're on the edges of the word?
- I tried splitting it but it's only doing it on the end of the word, not the 
  beginning
- Now it's doing neither
- The regex is currently: split if it's a comma OR a space OR a new line OR
  - a character class where it's space, then apostrophe, then letters, then 
    apostraphe then space

=end
