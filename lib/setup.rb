class Setup
  CODE_PEGS = %w[blue green yellow red pink orange].freeze
  attr_accessor :secret_pattern

  def initialize
    create_secret_pattern
  end

  def create_secret_pattern
    random_code_pegs = CODE_PEGS.flat_map { |peg| [peg] * 4 }
    @secret_pattern = random_code_pegs.sample(4)
    start_game
  end

  def start_game
    Game.new(@secret_pattern)
  end
end
