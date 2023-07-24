require './lib/ship'
require './lib/cell'
require './lib/board'


RSpec.describe Board do
  before(:each) do
    @board = Board.new 
    @cell_1 = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2) 
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

  describe "#validate_coordinate?" do
    it "validates a coordinate on the board" do
      expect(@board.validate_coordinate?("A1")).to eq true
      expect(@board.validate_coordinate?("D4")).to eq true
      expect(@board.validate_coordinate?("A5")).to eq false
      expect(@board.validate_coordinate?("E1")).to eq false
      expect(@board.validate_coordinate?("A22")).to eq false
    end 
  end

  describe "#valid_placement?" do
    it "determines if a placement for a ship is valid or not" do
      require 'pry'; binding.pry
      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq false
      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq false
    end
  end
end