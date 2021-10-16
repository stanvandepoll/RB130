def compute(argument)
  if block_given?
    yield(argument)
  else
    'Does not compute.'
  end
end

p compute(5) { |num| num + 3 } == 8
p compute('a') { |letter| letter + 'b' } == 'ab'
p compute(5) == 'Does not compute.'