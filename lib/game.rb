require 'pry'
class Game
  def initialize(secret_pattern, human, computer)
    @secret_pattern = secret_pattern
    @player_guess = nil
    @black_pegs = 0
    @white_pegs = 0
    @turn_number = 1
    @human = human
    @computer = computer
    start_game
  end

  def start_game
    if @human == 'Codebreaker'
      puts 'The codemaker has created a secret pattern'
      puts 'Guess four colors from these choices: '
      puts 'blue, green, yellow, red, pink, orange'
      ask_player_guess
    else
      computer_turn = AI.new(@secret_pattern)
    end
  end

  def ask_player_guess
    no_more_turns if @turn_number == 13
    puts 'Make a guess'
    @player_guess = gets.chomp
    verify_turn
  end

  def verify_turn
    @player_guess = @player_guess.split
    verify_win
  end

  def verify_win
    if @player_guess == @secret_pattern
      puts 'You Win!'
    else
      verify_black_peg
    end
  end

  def verify_black_peg
    black_peg_arr = @player_guess.map.with_index { |v, i| v == @secret_pattern[i] }
    count_black_pegs(black_peg_arr)
  end

  def count_black_pegs(black_peg_arr)
    @black_pegs = black_peg_arr.count(true)
    verify_white_peg(black_peg_arr)
  end

  def verify_white_peg(black_peg_arr)
    remainder_secret_pattern = []
    remainder_guess = []
    black_peg_arr.each_with_index do |v, i|
      if v == false
        remainder_secret_pattern.push(@secret_pattern[i])
        remainder_guess.push(@player_guess[i])
      end
    end
    count_white_pegs(remainder_secret_pattern, remainder_guess)
  end

  def count_white_pegs(remainder_secret_pattern, remainder_guess)
    remainder_guess.uniq!
    white_peg_arr = remainder_guess.map { |v| remainder_secret_pattern.include?(v) }
    @white_pegs = white_peg_arr.count(true)
    finish_turn
  end

  def finish_turn
    puts "Codemaker puts #{@black_pegs} black #{black_quantity} and #{@white_pegs} white #{white_quantity}"
    puts "This ends turn number #{@turn_number}"
    @turn_number += 1
    if @human == 'Codebreaker'
      ask_player_guess
    else
      guess_random_colors until @turn_number == 13
    end
  end

  def black_quantity
    if @black_pegs == 1
      'peg'
    else
      'pegs'
    end
  end

  def white_quantity
    if @white_pegs == 1
      'peg'
    else
      'pegs'
    end
  end

  def no_more_turns
    puts 'Codemaker wins! Codebreaker ran out of turns...'
    play_again
  end

  def play_again
    puts 'Do you want to play again? (Yes or No)'
    answer = gets.chomp
    if answer == 'Yes'
      new_game = Setup.new
    else
      exit
    end
  end
end

class AI < Game
  def initialize(secret_pattern)
    @secret_pattern = secret_pattern
    @turn_number = 1
    guess_random_colors
  end

  def guess_random_colors
    random_code_pegs = Setup::CODE_PEGS.flat_map { |peg| [peg] * 4 }
    @player_guess = random_code_pegs.sample(4)
    computer_answer
  end

  def computer_answer
    puts "The Codebreaker answers #{@player_guess}"
    verify_win
  end
end
