=begin
The simplest kind of linked list is a singly linked list. Each element
in the list contains data and a "next" field pointing to the next element
in the list of elements. This variant of linked lists is often used to
represent sequences or push-down stacks (also called a LIFO stack;
Last In, First Out).

Let's create a singly linked list whose elements may contain a range
of data such as the numbers 1-10. Provide functions to reverse the
linked list and convert a linked list to and from an array.

problem:
  create a singly linked list, each element has data and a pointer to
  the next element
  provide functions to reverse the list
  and to convert to and from array

test cases:

=end

class Element
  attr_reader :datum
  
  def initialize(datum)
    @datum = datum
  end
end