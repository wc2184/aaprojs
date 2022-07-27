class Hangman
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end
  # :: means class method (use self in def) , # is instance

  def self.random_word
    DICTIONARY.sample
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    array = []
    @secret_word.each_char.with_index do |letter, i|
      if letter == char
        array << i
      end
    end
    array
  end

  def fill_indices(char, arr)
    arr.each do |i|
      @guess_word[i] = char
    end
  end

  def try_guess(char)
    if already_attempted?(char)
      puts 'that has already been attempted'
      return false
    end
    @attempted_chars << char
    if get_matching_indices(char) == []
      @remaining_incorrect_guesses -= 1
    else
      fill_indices(char, get_matching_indices(char) )
    end

    def ask_user_for_guess
      puts "Enter a char"
      try_guess(gets.chomp)
    end

    def win?
      # p @guess_word.join("")
      # p @secret_word
       if @guess_word.join("") == @secret_word
        puts "WIN"
        return true
       else
        return false
       end
    end

    def lose?
      if @remaining_incorrect_guesses == 0
        puts "LOSE"
        return true
      else
        return false
      end
    end

    def game_over?
      if self.win? || self.lose?
        puts @secret_word
        return true
      else
        false
      end
    end


    return true
  end

  

end
