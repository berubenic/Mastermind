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
    ask_player_guess
  end

  def ask_player_guess
    puts 'Make a guess'
    player_guess = gets.chomp
    verify_turn(player_guess)
  end
end
