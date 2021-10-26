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
  attr_reader :datum, :next

  def initialize(datum, next_element= nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  def initialize
    @elements = []
  end

  def self.from_a(datums)
    linked_list = new
    datums ||= []
    
    datums.reverse.each do |datum|
      linked_list.push(datum)
    end
    linked_list
  end

  def push(datum)
    @elements.unshift(Element.new(datum, @elements.first))
  end

  def pop
    popped_element = @elements.shift
    popped_element.datum
  end

  def size
    @elements.size
  end

  def empty?
    @elements.empty?
  end

  def peek
    head&.datum
  end

  def head
    @elements.first
  end
end