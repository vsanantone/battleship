require 'rspec'
require './lib/ship'

RSpec.describe Ship do
  before(:each) do 
    @cruiser = Ship.new("Cruiser", 3)
  end

  describe "#initialize" do
    it "exists" do
      expect(@cruiser).to be_a Ship
    end
  end

  describe "#readable attributes" do
    it "has a name, length, and health" do
      expect(@cruiser.name).to eq "Cruiser"
      expect(@cruiser.length).to eq 3
      expect(@cruiser.health).to eq 3
    end
  end

  describe "#sunk?" do
    it "has sunk?" do
      expect(@cruiser.sunk?).to eq false
    end
  end

  describe "#hit" do
  it "ship is hit" do
      expect(@cruiser.health).to eq 3
      expect(@cruiser.sunk?).to eq false

      @cruiser.hit
      
      expect(@cruiser.health).to eq 2
      
      @cruiser.hit
      
      expect(@cruiser.health).to eq 1
      expect(@cruiser.sunk?).to eq false
      
      @cruiser.hit
      
      expect(@cruiser.health).to eq 0
      expect(@cruiser.sunk?).to eq true
    end
  end
end

