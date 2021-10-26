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
    elements.empty?
  end

  def contains?(integer)
    elements.include?(integer)
  end

  def subset?(other)
    subtract_elements_with(other).empty?
  end

  def disjoint?(other)
    shared_elements(other).empty?
  end

  def intersection(other)
    self.class.new(shared_elements(other))
  end

  def difference(other)
    self.class.new(subtract_elements_with(other))
  end

  def union(other)
    joined_elements = elements + other.elements
    self.class.new(joined_elements)
  end

  def eql?(other)
    elements.sort == other.elements.sort
  end

  def add(integer)
     @elements << integer unless contains?(integer)
     self
  end

  def ==(other)
    eql?(other)
  end

  protected
  attr_reader :elements

  def shared_elements(other)
    elements & other.elements
  end

  def subtract_elements_with(other)
    elements - other.elements
  end
end