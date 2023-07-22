require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  describe "#initialize" do
    it "exists" do
     expect(@cell).to be_a Cell
    end 
  end

  describe "#readable attributes" do
    it "has a coordinate" do
     expect(@cell.coordinate).to eq "B4"
    end 

    it "has a ship" do
      expect(@cell.ship).to eq nil
     end 
  end

  describe "empty?" do
    it "determines if a cell is empty" do
      expect(@cell.empty?).to eq true
    end
  end

  describe "#place_ship" do
    it "places a ship on the board" do
      require 'pry';binding.pry
      @cell.place_ship(@cruiser)

      expect(@cell.ship).to eq @cruiser
    end
  end
end