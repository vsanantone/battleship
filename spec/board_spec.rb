require './lib/ship'
require './lib/cell'
require './lib/board'


RSpec.describe Board do
  before(:each) do
    @board = Board.new 
  end

  describe "#initialize" do
    it "exists" do
     expect(@board).to be_a Board
    end 
  end

  describe "#generate_cells" do
    it "generates a 4x4 grid" do
     expect(@board.generate_cells).to be_a Array
     expect(@board.cells).to be_a Hash
    end 
  end
end