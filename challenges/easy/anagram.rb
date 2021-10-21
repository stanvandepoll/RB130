=begin

Write a program that takes a word and a list of possible anagrams
and selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like
"enlists", "google", "inlets", and "banana", the program should
return a list containing "inlets". Please read the test suite
for the exact rules of anagrams.

problem
input word and list of possible anagrams
output list of actual anagrams, selected from unput list
rules (from test cases)
  - identical words are not anagrams
  - case-insensitive

data: array to loop through
      convert string to array to check for anagram

algo:
loop through possible anagrams with select
  return false if same as word
  word.chars.sort == candidate.chars.sort
end

=end

class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(candidates)
    sorted_word = @word.chars.sort
    candidates.select do |candidate|
      down_candidate = candidate.downcase
      next if @word == down_candidate
      
      sorted_word == down_candidate.chars.sort
    end
  end
end