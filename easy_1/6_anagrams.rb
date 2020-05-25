# The Anagram class that detects anagrams from a test word and optional words.
class Anagram
  attr_reader :test_word

  def initialize(test)
    @test_word = test.downcase
  end

  def match(arr_of_options)
    delete_duplicates(arr_of_options)
    arr_of_options.select { |w| w.downcase.chars.sort == test_word.chars.sort }
  end

  private

  def delete_duplicates(arr)
    arr.delete_if { |w| w.casecmp(test_word.downcase).zero? }
  end
end
