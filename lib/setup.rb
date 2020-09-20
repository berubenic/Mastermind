# frozen_string_literal: true

# Create the secret_pattern
class Setup
  CODE_PEGS = %w[blue green yellow red pink orange].freeze

  def initialize(human, computer)
    @secret_pattern = nil
    @computer = computer
    @human = human
    if @human == 'Codebreaker'
      create_secret_pattern
    else
      ask_secret_pattern
    end
  end

  def create_secret_pattern
    random_code_pegs = CODE_PEGS.flat_map { |peg| [peg] * 4 }
    @secret_pattern = random_code_pegs.sample(4)
    start_game
  end

  def ask_secret_pattern
    puts 'Codemaker, create the secret pattern with four of these colors: '
    puts 'blue, green, yellow, red, pink, orange'
    answer = gets.chomp
    store_secret_pattern(answer)
  end

  def store_secret_pattern(answer)
    @secret_pattern = answer.split
    start_game
  end

  def start_game
    Game.new(@secret_pattern, @human, @computer)
  end
end
