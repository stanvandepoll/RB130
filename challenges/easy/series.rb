=begin
Write a program that will take a string of digits and return all
the possible consecutive number series of a specified length in that string.

if you ask for a larger series than the string, throw an error.

test cases:
  Series.new accepts number_string argument
  slices method accepts the slice_length argument (integer)
  return array of arrays with all consecutive slices of that length
  raise ArgumentError if requested slice_lenght > number_string

data:
  turn number_string into array of integers
  array of slices to return

algo:
  number_string is given
  slice_length is given
  slices = []
  loop from 0 up to digits.size - slice_length |start_index|
    slice = number_string[start_index, slice_length].chars.map(&:to_i)
    slices << slice
  end
  return slices
=end

class Series
  def initialize(number_string)
    @number_string = number_string
  end

  def slices(slice_length)
    raise ArgumentError if slice_length > @number_string.size
    
    slices = []
    0.upto(@number_string.size - slice_length) do |start_index|
      slice = @number_string[start_index, slice_length].chars.map(&:to_i)
      slices << slice
    end
    slices
  end
end