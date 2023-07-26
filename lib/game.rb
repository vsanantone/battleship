class Game
  attr_reader :start_game

  def initialize
    @start_game =  "Welcome to BATTLESHIP"
  end

  def intro
   puts @start_game
  end
end

