=begin
convert decimals into roman number equivalents

decimals can be extracted to thousands, hundreds, tens and ones
and than converted to romans left to right.

1000 => M
500 => D
100 => C
50 => L
10 => X
5 => V
1 => I

test cases
for each level you have a fiver and a oner symbol, like L and X
if the number is 4 you do [oner][fiver], nine is [oner][higher_symbol]

algo
transform integer to thousands, hundreds, tens, ones hash by repeatedly
running the modulus operation
initialize numeral to empty string
iterate through hash from high to low
  get values for oner fiver and higher roman symbols
  convert current digit to symbol using those values
  append symbol to resulting numeral
end
return numeral

=end

class RomanNumeral
  LEVEL_TO_SYMBOLS = {
    thousands: ['M', nil, nil],
    hundreds: ['C', 'D', 'M'],
    tens: ['X', 'L', 'C'],
    ones: ['I', 'V', 'X']
  }


  def initialize(integer)
    @integer = integer
    @values_hash = generate_values_hash
  end

  def to_roman
    numeral = ''
    @values_hash.each do |decimal_level, level_amount|
      numeral << level_numeral(level: decimal_level, amount: level_amount)
    end
    numeral
  end

  private

  def level_numeral(level:, amount:)
    oner, fiver, tenner = get_symbols(level)
    to_numeral(digit: amount, oner: oner, fiver: fiver, tenner: tenner)
  end

  def to_numeral(digit:, oner:, fiver:, tenner:)
    case digit
    when 1..3
      oner * digit
    when 4
      oner + fiver
    when 5..8
      fiver + (oner * (digit % 5))
    when 9
      oner + tenner
    end
  end

  def get_symbols(level)
    LEVEL_TO_SYMBOLS[level]
  end

  def generate_values_hash
    remainder = @integer
    values_hash = {}

    { thousands: 1000, hundreds: 100, tens: 10, ones: 1 }.each do |key, divisor|
      turn_result, remainder = remainder.divmod(divisor)
      next if turn_result.zero?

      values_hash[key] = turn_result
    end

    values_hash
  end
end