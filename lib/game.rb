class Game
  CODE_PEGS = %w[blue, green, yellow, red, pink, orange].freeze
  KEY_PEGS = %w[black, white].freeze

  def initialize
    create_multiple_code_pegs
  end

  def create_multiple_code_pegs
    multiplied_code_pegs = CODE_PEGS.flat_map { |peg| [peg] * 4 }
    choose_secret_pattern(multiplied_code_pegs)
  end

  def choose_secret_pattern(code_pegs)
    secret_pattern = code_pegs.sample(4)
    p secret_pattern
  end

  def guess_secret_pattern; end
end

new_game = Game.new
