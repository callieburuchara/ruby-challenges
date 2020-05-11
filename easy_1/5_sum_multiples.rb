require 'pry'

class SumOfMultiples
  attr_reader :numbers
  
  def self.to(num)
    SumOfMultiples.new(3, 5).to(num)
  end

  def initialize(*numbers)
    @numbers = *numbers
  end

  def to(num)
    (1...num).select do |range| 
      numbers.any? do |multiple| 
        (range % multiple).zero?
      end
    end.sum
  end

end

