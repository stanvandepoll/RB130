def divisors(integer)
  return [1] if integer == 1

  lower_divisors = 1.upto(Math.sqrt(integer).floor).select do |number|
    integer % number == 0
  end

  higher_divisors = lower_divisors.reverse.map do |lower_divisor|
    integer / lower_divisor
  end

  lower_divisors + higher_divisors
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]