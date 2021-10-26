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
  attr_reader :head

  def self.from_a(datums)
    linked_list = new
    datums ||= []

    datums.reverse.each do |datum|
      linked_list.push(datum)
    end
    linked_list
  end

  def to_a
    array = []
    current_elem = head
    while current_elem
      array.push(current_elem.datum)
      current_elem = current_elem.next
    end
    array
  end

  def reverse
    datums = to_a
    self.class.from_a(datums.reverse)
  end

  def push(datum)
    @head = Element.new(datum, @head)
  end

  def pop
    datum = peek
    @head = @head.next
    datum
  end

  def size
    size = 0
    current_elem = @head
    while (current_elem)
      size += 1
      current_elem = current_elem.next
    end
    size
  end

  def empty?
    head.nil?
  end

  def peek
    head&.datum
  end
end