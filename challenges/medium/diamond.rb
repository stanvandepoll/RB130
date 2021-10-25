# The diamond exercise takes as its input a letter, and outputs it
# in a diamond shape. Given a letter, it prints a diamond starting
# with 'A', with the supplied letter at the widest point.

# The first row contains one 'A'.
# The last row contains one 'A'.
# All rows, except the first and last, have exactly two identical letters.
# The diamond is horizontally symmetric.
# The diamond is vertically symmetric.
# The diamond has a square shape (width equals height).
# The letters form a diamond shape.
# The top half has the letters in ascending order.
# The bottom half has the letters in descending order.
# The four corners (containing the spaces) are triangles.

# input: letter
# output: diamond according to rules

# the letter part goes from A up to given letter, and back to A
# the amount of spaces on the left goes from n to 0, back to n
# spaces in middle go from 0 to 2n - 1, back to 0.
# N table:
# A => 0
# B => 1
# C => 2, etc. = letter.ord - A.ord

# test cases:
#   whitespace on left side should also be added on right side
#   end each line with a newline

# data structure:
#   determine N, integer
#   create array of diamond lines
#   loop up and loop down

# algo:
# determine diamond_size = letter.ord - 'A'.ord
#   initialize lines as empty string
#   loop from line_index 0 up to diamond_size
#     lines << line(line_index, diamond_size)
#   end
#   loop from line_index diamond_size-1 down to 0
#     lines << line(line_index, diamond_size)
#   end
#   return lines
#     line:
#       current_letter = ('A'.ord + line_index).chr
#       outer_white = diamond_size - line_index
#       inner_white = 2*line_index - 1 (0 if line_index.zero?)

module Diamond
  def self.make_diamond(letter)
    diamond_size = letter.ord - 'A'.ord
    lines = ''

    0.upto(diamond_size) do |line_index|
      lines << line(line_index, diamond_size)
    end
    (diamond_size - 1).downto(0) do |line_index|
      lines << line(line_index, diamond_size)
    end

    lines
  end

  def self.line(line_index, diamond_size)
    letter = ('A'.ord + line_index).chr
    outer_padding = ' ' * (diamond_size - line_index)
    if line_index.zero?
      "#{outer_padding}#{letter}#{outer_padding}\n"
    else
      inner_padding = ' ' * (2 * line_index - 1)
      "#{outer_padding}#{letter}#{inner_padding}#{letter}#{outer_padding}\n"
    end
  end
end