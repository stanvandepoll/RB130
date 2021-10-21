=begin
compute scrabble score of a word

use hash with letters as keys and score as value

loop through characters of word and sum all scores per letter together
=end

class Scrabble
  SCORES = {
    'A' => 1, 'E' => 1, 'I' => 1, 'O' => 1, 'U' => 1,
    'L' => 1, 'N' => 1, 'R' => 1, 'S' => 1, 'T' => 1,
    'D' => 2, 'G' => 2, 'B' => 3, 'C' => 3, 'M' => 3,
    'P' => 3, 'F' => 4, 'H' => 4, 'V' => 4, 'W' => 4,
    'Y' => 4, 'K' => 5, 'J' => 8, 'X' => 8, 'Q' => 10,
    'Z' => 10
  }
  def initialize(word)
    @letters = [] if word.nil?
    @letters ||= word.upcase.chars
  end

  def score
    @letters.sum { |letter| letter_score(letter) }
  end

  def self.score(word)
    instance = new(word)
    instance.score
  end

  def letter_score(letter)
    SCORES.fetch(letter, 0)
  end
end