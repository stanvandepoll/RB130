# Write a program to determine whether a triangle is equilateral,
# isosceles, or scalene.

# An equilateral triangle has all three sides the same length.

# An isosceles triangle has exactly two sides of the same length.

# A scalene triangle has all sides of different lengths.

# Note: For a shape to be a triangle at all, all sides must be of
# length > 0, and the sum of the lengths of any two sides must be
# greater than the length of the third side.
=begin
Problem
  input 3 integers representing side lengths
  output one of three strings or error
return error if not a valid triangle
  - all sides > 0
  - sum of any two sides > other side
return equilateral if all 3 sides have same length
       isosceles if 2 sides have same length
       scalene if all sides have different length

examples see test cases

data structure
  array of integers for lengths

algo
  first check if triangle is valid
  than if else statements to return string

=end

class Triangle
  def initialize(*sides)
    @sides = sides
    raise ArgumentError unless valid?
  end

  def kind
    case @sides.uniq.size
    when 1
      'equilateral'
    when 2
      'isosceles'
    else
      'scalene'
    end
  end

  def valid?
    @sides.all?(&:positive?) &&
      @sides[0] + @sides[1] > @sides[2] &&
      @sides[0] + @sides[2] > @sides[1] &&
      @sides[1] + @sides[2] > @sides[0]
  end
end