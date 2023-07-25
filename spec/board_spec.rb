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

  describe "#consecutive_coordinates?" do
    it "will determine that coordinates are consecutive" do
      expect(@board.consecutive_coordinates?(["A1", "A2", "A4"])).to eq false
      expect(@board.consecutive_coordinates?(["C2", "C3", "C5"])).to eq false
      expect(@board.consecutive_coordinates?(["A1", "A2", "A3"])).to eq true
      expect(@board.consecutive_coordinates?(["C1", "C2"])).to eq true
    end
  end

  describe "#consecutive_numbers?" do
    it "will determine if numbers and letters are consecutive" do
      expect(@board.consecutive_numbers?([1, 2, 3])).to eq true
      expect(@board.consecutive_numbers?([1, 3, 4])).to eq false
    end
  end

  describe "#valid_placement?" do
    it "determines if a placement for a ship is valid or not" do

      #array should be the same as the length of the ship:
      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq false
      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq false

      #coordinates are consecutive:
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq false
      expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq false
      expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq false
      expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq false

      #coordinates can’t be diagonal:
      expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C1"])).to eq false
      expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq false

      #pass all previous checks
      expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq true
      expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq true
    end
  end

  describe "#place" do
    it "places a ship on the grid" do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      cell_1 = @board.cells["A1"]
      cell_2 = @board.cells["A2"]
      cell_3 = @board.cells["A3"]

      expect(cell_1.ship).to eq @cruiser
      expect(cell_2.ship).to eq @cruiser
      expect(cell_3.ship).to eq @cruiser 

      expect(cell_3.ship).to eq cell_2.ship
    end
  end
end