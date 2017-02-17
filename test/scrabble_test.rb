gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
# require 'minitest/emoji'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_words
    assert_equal 9, Scrabble.new.score("world")
  end

  def test_it_can_score_multipliers
    score = Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1], 1) 
    double_score = Scrabble.new.score_with_multipliers('hello', [2,2,2,2,2], 1)
    assert_equal 9, score
    assert_equal 16, double_score
  end

  def test_it_can_score_word_multipliers
    score = Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1], 2) 
    assert_equal 18, score
  end
  
  def test_it_gives_7_char_word_bonus
    score = Scrabble.new.score_with_multipliers('aaaaaaa', [1,1,1,1,1,1,1], 1) 
    assert_equal 17, score
  end

  def test_sparkle
    score = Scrabble.new.score_with_multipliers('sparkle', [1,1,1,1,1,1,1], 2)
    assert_equal 36, score
  end

end
