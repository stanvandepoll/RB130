require 'pry-byebug'

class TextAnalyzer
  def initialize
    File.open('sample_text.txt') do |file|
      @file_data = file.readlines.map(&:chomp)
    end
  end

  def process
    yield(@file_data)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |data| p "#{data.count('') + 1} paragraphs" }
analyzer.process { |data| p "#{data.size} lines" }
analyzer.process { |data| p "#{data.join(' ').split.size} words" }