require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do
  before(:each) do
    @game = Game.new
  end

  describe "#intro" do
    it "prints welcome message" do
      @game.intro
    end
  end
end