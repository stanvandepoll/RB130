require 'minitest/autorun'
require 'pry-byebug'
require_relative 'text.rb'

class TextTest < Minitest::Test
  def setup
    @file_contents = File.read('sample_text.txt')
    @text_instance = Text.new(@file_contents)
  end

  def test_swap
    actual_text = @text_instance.swap('a', 'e')
    expected_text = @file_contents.gsub('a', 'e')
    
    assert_equal(expected_text, actual_text)
  end

  def test_word_count
    assert_equal(72, @text_instance.word_count)
  end
end