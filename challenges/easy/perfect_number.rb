=begin
write a program that can tell whether a number is perfect, abundant, or deficient.

aliquot sum is the sum of the divisors other than itself
aliquot == self => perfect
aliquot > self => abundant
aliquot < self => deficient

see test cases
  return error for negative number

use loop till self to add divisors
than compare to self

=end

module PerfectNumber
  def self.classify(number)
    raise StandardError if number.negative?

    aliquot_sum = find_divisor_sum(number)
    number_type(number, aliquot_sum)
  end

  private

  def self.find_divisor_sum(number)
    sum = 0
    1.upto(number - 1) do |divisor|
      sum += divisor if number % divisor == 0
    end
    sum
  end

  def self.number_type(number, aliquot_sum)
    case aliquot_sum <=> number
    when 1
      'abundant'
    when -1
      'deficient'
    when 0
      'perfect'
    end
  end
end