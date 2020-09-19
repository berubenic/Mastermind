class Game
  attr_reader :secret_pattern

  def initialize(secret_pattern)
    @secret_pattern = secret_pattern
    start_game
  end

  def start_game
    puts 'The codemaker has created a secret pattern'
    puts 'Guess four colors from these choices: '
    puts 'blue, green, yellow, red, pink, orange'
    p @secret_pattern
    ask_player_guess
  end

  def ask_player_guess
    puts 'Make a guess'
    player_guess = gets.chomp
    verify_turn(player_guess)
  end

  def verify_turn(player_guess)
    guess_array = player_guess.split
    verify_win(guess_array)
  end

  def verify_win(guess_array)
    if guess_array == @secret_pattern
      puts 'You Win!'
    else
      verify_black_peg(guess_array)
    end
  end

  def verify_black_peg(guess_array)
    black_peg_arr = guess_array.map.with_index { |v, i| v == @secret_pattern[i] }
    black_pegs = black_peg_arr.count(true)
    p black_pegs
    verify_white_peg(black_peg_arr, guess_array)
  end

  def verify_white_peg(black_peg_arr, guess_array)
    remainder_secret_pattern = []
    remainder_guess = []
    black_peg_arr.each_with_index do |v, i|
      if v == false
        remainder_secret_pattern.push(@secret_pattern[i])
        remainder_guess.push(guess_array[i])
      end
    end
    remainder_guess.uniq!
    white_peg_arr = remainder_guess.map { |v| remainder_secret_pattern.include?(v) }
    white_pegs = white_peg_arr.count(true)
    p white_pegs
  end
end
