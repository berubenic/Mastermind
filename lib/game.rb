class Game
  attr_reader :secret_pattern

  def initialize(secret_pattern)
    @secret_pattern = secret_pattern
    p @secret_pattern
  end
end
