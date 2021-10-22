=begin
Write a program that, given a natural number and a set of one
or more other numbers, can find the sum of all the multiples
of the numbers in the set that are less than the first number.
If the set of numbers is not given, use a default set of 3 and 5.

For instance, if we list all the natural numbers up to, but not
including, 20 that are multiples of either 3 or 5, we get 3, 5,
6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

problem
  input: integer and array of other numbers, default others to 3 and 5
  output: integer, that is the sum of all 'multiples'

test cases
  multiples do not include self
  multiples count once each, so no doubles

data structure:
  array for factors
  array for multiples

algo:
  limit = natural number argument
  factors = other numbers array or [3, 5]
  initialize multiples to []
  loop from 1 to limit - 1
    add current number if number % any of factors is zero
      means submethod factors.any? { |factor| number % factor == 0 }
  end
  return multiples.sum
=end

class SumOfMultiples
  def initialize(*factors)
    @factors = factors.any? ? factors : [3, 5]
  end

  def self.to(limit)
    new.to(limit)
  end

  def to(limit)
    1.upto(limit - 1).select do |current_number|
      multiple?(current_number)
    end.sum
  end

  private

  def multiple?(number)
    @factors.any? { |factor| (number % factor).zero? }
  end
end