def bubble_sort!(array, &comparer)
  comparer ||= Proc.new { |first, second| first <= second }

  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if comparer.call(array[index - 1], array[index])

      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)

def bubble_sort_further!(array, &compare_by)
  compare_by ||= :self.to_proc

  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if compare_by.call(array[index - 1]) <= compare_by.call(array[index])

      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort_further!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)