def missing(sorted_array)
  all_integers_covered = ((sorted_array.first)..(sorted_array.last)).to_a
  all_integers_covered - sorted_array
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []