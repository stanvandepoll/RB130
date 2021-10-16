def step(begin_value, end_value, step_size)
  counter = begin_value

  loop do
    break if counter > end_value

    yield(counter)
    counter += step_size
  end

  nil
end

step(1, 10, 3) { |value| puts "value = #{value}" }