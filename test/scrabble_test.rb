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
    game = Scrabble.new
    score = game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2) 
    assert_equal 58, score
  end

  def test_highest_scoring_word
    game = Scrabble.new
    highest = game.highest_scoring_word(['home', 'word', 'hello', 'sound'])
    assert_equal "home", highest
  end
  
  def test_smaller_wins_a_tie
    game = Scrabble.new
    winner = game.highest_scoring_word(['hello', 'word', 'sound']) 
    assert_equal "word", winner
  end
  
  def test_all_7_bonus
    game = Scrabble.new
    winner = game.highest_scoring_word(['hello', 'word', 'sound']) 
    assert_equal "word", winner
  end

  def test_perfect_tie_returns_first
    game = Scrabble.new
    winner = game.highest_scoring_word(['hi', 'word', 'ward'])
    assert_equal "word", winner
  end

end
