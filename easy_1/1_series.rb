class Series
  attr_accessor :str
  
  def initialize(str)
    @str = str
  end

  def slices(num)
    raise ArgumentError.new("Slice is longer than input.") if num > str.size
    str.chars.map(&:to_i).each_cons(num).to_a 
  end
end


=begin
-input: a string of digits
-output: all possible consecutive number series of length n in that string
--> array
--> array of integers, each number is separated by commas

-should I just use #each_cons(n) ? 

OBSERVATIONS FROM TEST SUITE
- class is called Series
- all of the tests are simply testing the `slices` method, so I think that's all I need to make. 
- I also need to raise an Argument error if the given number is greater than the caller's size



=end
