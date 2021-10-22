=begin
problem turn octal input into decimal number
last digit should be multiplied by 8^0
the digit before that by 8^1
the one before that by 8^2
and so on.

examples
  invalid octal should return zero

data structure: use array of digits

algo:
turn input into digits reversed
than loop through those digits with index
  return digit * 8^index
end.sum
=end

class Octal
  def initialize(octal_string)
    @octal_string = octal_string
  end

  def to_decimal
    return 0 if @octal_string.match(/[^0-7]/)

    @octal_string.to_i.digits.map.with_index do |digit, index|
      digit * (8**index)
    end.sum
  end
end