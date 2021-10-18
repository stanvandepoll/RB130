factorial_enum = Enumerator.new do |yielder|
  current_factorial = 1
  n = 0

  yielder << current_factorial
  loop do
    n += 1
    current_factorial = current_factorial * n
    yielder <<  current_factorial
  end
end

p 7.times.map { factorial_enum.next }
p 3.times.map { factorial_enum.next }
factorial_enum.rewind
p 7.times.map { factorial_enum.next }