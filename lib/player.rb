class Player
  def initialize
    @human = nil
    @computer = nil
    ask_human_role
  end

  def ask_human_role
    puts 'Do you want to play as Codemaker or Codebreaker?'
    answer = gets.chomp
    assign_role(answer)
  end

  def assign_role(answer)
    if answer == 'Codemaker'
      @human = answer
      @computer = 'Codebreaker'
    elsif answer == 'Codemaker'
      @human = answer
      @computer = 'Codebreaker'
    else
      ask_human_role
    end
    Setup.new
  end
end
