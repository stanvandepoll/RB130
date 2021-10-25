=begin
The diamond exercise takes as its input a letter, and outputs it
in a diamond shape. Given a letter, it prints a diamond starting
with 'A', with the supplied letter at the widest point.

The first row contains one 'A'.
The last row contains one 'A'.
All rows, except the first and last, have exactly two identical letters.
The diamond is horizontally symmetric.
The diamond is vertically symmetric.
The diamond has a square shape (width equals height).
The letters form a diamond shape.
The top half has the letters in ascending order.
The bottom half has the letters in descending order.
The four corners (containing the spaces) are triangles.

input: letter
output: diamond according to rules

the letter part goes from A up to given letter, and back to A
the amount of spaces on the left goes from n to 0, back to n
spaces in middle go from 0 to 2n - 1, back to 0.
N table:
A => 0
B => 1
C => 2, etc. = letter.ord - A.ord

test cases:
  whitespace on left side should also be added on right side
  end each line with a newline

data structure:
  determine N, integer
  create array of diamond lines
  loop up and loop down

algo:
determine n = letter.ord - 'A'.ord
  initialize lines as empty string
  loop from line_index 0 up to n
    lines << line(line_index, n)
  end
  loop from line_index n-1 down to 0
    lines << line(line_index, n)
  end
  return lines
    line:
      current_letter = ('A'.ord + line_index).chr
      outer_white = n - line_index
      inner_white = 2*line_index - 1 (0 if line_index.zero?)
=end

module Diamond
  def self.make_diamond(letter)
    n = letter.ord - 'A'.ord
    lines = ''

    0.upto(n) do |line_index|
      lines << line(line_index, n)
    end
    (n - 1).downto(0) do |line_index|
      lines << line(line_index, n)
    end

    lines
  end

  def self.line(line_index, n)
    letter = ('A'.ord + line_index).chr
    outer_white = n - line_index
    if line_index.zero?
      ' ' * outer_white + letter + ' ' * outer_white + "\n"
    else
      inner_white = 2 * line_index - 1
      ' ' * outer_white + letter + ' ' * inner_white + letter + ' ' * outer_white + "\n"
    end
  end
end