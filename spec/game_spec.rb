require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do
  before(:each) do
    @game = Game.new
  end

  describe "#initialize" do
    it "exists" do
     expect(@game).to be_a Game
    end 
  end

  describe "#start_game" do
    it "starts the game" do
      expect(@game.start_game).to eq "Welcome to BATTLESHIP"    
    end
  end
end