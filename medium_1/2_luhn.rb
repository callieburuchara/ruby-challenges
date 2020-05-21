class Luhn

  attr_reader :integer

  def initialize(integer)
    @integer = integer.digits.reverse
  end

  def addends
    integer.reverse.each_with_index.map do |num, idx|
      if idx.even?
        num
      else
        num * 2 > 10 ? num * 2 - 9 : num * 2
      end
    end.reverse
  end


  def checksum
    addends.sum
  end

  
  def valid?
    checksum % 10 == 0 
  end

  def self.create(number)
   new_number = number * 10
   if new(new_number).valid?
     new_number
   else
     remainder = new(new_number).checksum % 10
     new_number += (10 - remainder)
   end
  end
end
