require 'rspec'
require './lib/ship'

RSpec.describe Ship do
  before(:each) do 
    @cruiser = Ship.new("Cruiser", 3)
  end

  describe "#initialize" do
    it "exists" do
      expect(@cruiser).to be_a(Ship)
    end
  end

  describe "#readable attributes" do
    it "has a name, length, and health" do
      expect(@cruiser.name).to eq("Cruiser")
      expect(@cruiser.length).to eq(3)
      expect(@cruiser.health).to eq(3)
      require 'pry';binding.pry
    end
  end
end
