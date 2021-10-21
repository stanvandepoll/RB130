=begin
calculate the hamming distance between two dna strands
  -number of differences between two homologous dna strands
  -only defined for strands of equal length
    -if different lengths only determine for shortest length

examples see test cases

data: array zip

algo
store each strand in an array
determine length of shortest array
initialize hamming number to zero
loop from 0 to shortest_array_length - 1
  add one to hamming_number if different elements
end
return hamming number
=end

class DNA
  def initialize(strand)
    @strand = strand.chars
  end

  def hamming_distance(other_strand_string)
    other_strand = other_strand_string.chars
    shortest_strand_length = [@strand.size, other_strand.size].min
    hamming_number = 0

    shortest_strand_length.times do |index|
      hamming_number += 1 if @strand[index] != other_strand[index]
    end

    hamming_number
  end
end