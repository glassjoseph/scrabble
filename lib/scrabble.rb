require 'pry'

class Scrabble


  def score(word)
    word.upcase.chars.map do |letter|
      point_values[letter]
    end.reduce(:+)
    word.upcase.chars.map do |letter|
      point_values[letter]
    end.reduce(:+)
  end

  def score_with_multipliers(word, letter_multipliers, word_mulitiplier=1) 

    word_score = word.chars.map.with_index do |letter, index|
      score(letter) * letter_multipliers[index]
    end.reduce(:+)

    word_score += 10 if word.length >= 7
    word_score *= word_mulitiplier 
    word_score
  end
  
  def highest_scoring_word(words)
    highest = words.max_by{|word| score(word)}
    #grab all words w/highest score
    words.select!{ |word| score(word) == score(highest)}
    #return 7 length word
    words.each { |word| return word if word.length == 7}
    words.max_by{ |word| -word.length}
    


    # if score(words[0]) == score(words[1])
    #   return [words[0], words[1]].max_by {|word| -word.length}
    # else 
    #   words[0]
    # end
  end







  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end
end
  
#  game = Scrabble.new
#  words = ['home', 'word', 'hello', 'sound']
# binding.pry
# ""