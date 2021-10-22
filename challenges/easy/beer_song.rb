=begin
Write a program that can generate the lyrics of the 99 Bottles of Beer song.

input: verse numbers start and end (both optional)
output: string of all verses together with line breaks between them.
test cases
  first verse is "99 bottles of beer on the wall, 99 bottles of beer.\n" \
      "Take one down and pass it around, 98 bottles of beer on the wall.\n"
  next verses continue down from 99 to 3, only changing the number.
  verse with number 2 changes to singular bottle like:
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  verse with number 1 changes to:
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
  verse with zero is the last verse:
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

data structure
  integers for verse numbers
  output string

algo
  initialize song string
  loop from start to end verse
    add verse to song string
  end
  return song string
=end

module BeerSong
  def self.lyrics
    verses
  end

  def self.verses(start_verse= 99, end_verse= 0)
    start_verse.downto(end_verse).map do |verse_number|
      verse(verse_number)
    end.join("\n")
  end

  def self.verse(verse_number)
    case verse_number
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      "#{verse_number} bottles of beer on the wall, #{verse_number} bottles of beer.\n" \
      "Take one down and pass it around, #{verse_number - 1} bottles of beer on the wall.\n"
    end
  end
end
