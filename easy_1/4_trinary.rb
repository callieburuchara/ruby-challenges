class Trinary
  def initialize(str)
    @input = str
  end

  def to_decimal
    return 0 if invalid_trinary?    
    numbers = @input.to_i.digits

    numbers.each_with_index.map {|num, idx| 3**idx * num}.reduce(:+)
  end

  private

  def invalid_trinary?
    @input =~ /[^0-2]/
  end
end


=begin
-input: string of number
-output: integer number

- convert a trinary number (represented as a string) to its decimal equivalent using first principles (no using a method or library)

TRINARY NUMBERS
- Trinary numbers can only contain 3 symbols: 0, 1, and 2
- Invalid trinary entries should return 0

- the last place in a trinary number is the 1s place
- the second to last is the 3's place
- the third to last is the 9's place
- ..etc


=end
