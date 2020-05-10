class Octal
  def initialize(str)
    @input = str
  end

  def to_decimal
    return 0 if @input =~ /[^0-7]/
    
    number = @input.to_i.digits
    
    new_number = 0
    power = 0
    until number.empty?
      new_number += (number.shift * (8 ** power) )
      power += 1
    end
    new_number
  end
end

=begin
CHALLENGE: implement octal to decimal conversion

input: octal input string
output: decimal output

- implement the conversion from scratch. Do not use something else to perform the conversion for me.
- treat invalid input as octal 0
--> what is invalid input?
- only uses digits 0 to 7, so any other digits makes the input invalid
- no letters either

- pop each number from @number and times it by 8 raised to an ever increasing number, starting at 0
- do a loop, while popping, and end the loop once the array is empty
=end
