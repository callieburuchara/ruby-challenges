class Sieve
  attr_reader :true_range, :iterate_range

  def initialize(number)
    @true_range = (2..number).to_a
    @iterate_range = (2..(Math.sqrt(number).to_i))
  end

  def primes
    iterate_range.each do |iterating_num|
      true_range.delete_if do |composite_num|
        next if composite_num == iterating_num
        (composite_num % iterating_num).zero?
      end
    end    
  true_range
  end
end


=begin
SIEVE OF ERATOSTHENES understanding
- goal: find all prime numbers up to 100
- start: at 1
- assume all numbers/squares are unmarked at the beginning
- if we find a number that is unmarked, we can assume it's prime
- 2 is unmarked, so it is prime. and now that we found it, we can mark all multiples of 2 because they're 'composite'
- 3 is unmarked, so it is prime. Now we mark all multiples of 3. 
- We skip 4 because it's already composite
- Now we get to 5, it's prime. Now we mark all multiples of 5 (that are still unmarked)
- Now we hit 7. It's prime. Now we mark all multiples of 7. 
- Now 11 is prime. And 121 is greater than 100, so we can stop there. 
- We actually could've stopped at 10, because at that point, all numbers that are still unmarked are prime. 

Algorithm
- For all numbers for from 2 to sqrt(n)
IF a is unmarked THEN
a is prime
for all multiples of a (that are less than n)
mark them as composite (not prime)


OUR PROGRAM
- Use Sieve of E to find all primes from 2 up to a given number (include the given number)
- iterate from 2 until the squareroot of the given number

=end
