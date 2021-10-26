=begin
In this exercise you will define your own set type.
you may assume that all elements of a set must be numbers

test cases:
  CustomSet.new accepts optional argument array of integers, ignore duplicates
  contains? method works like includes
  subset? return true if argument has all elements of caller
  disjoint? return true if there is no overlap in elements
  eql? returns true if unique elements are the same
=end

class CustomSet
  def initialize(integers= [])
    @elements = integers.uniq
  end

  def empty?
    @elements.empty?
  end

  def contains?(integer)
    @elements.include?(integer)
  end
end