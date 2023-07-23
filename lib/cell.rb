class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty? 
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if @ship
      @ship.hit
    end

    @fired_upon = true
  end

  def render(expose_ship = false)
    if !fired_upon?
      expose_ship && !empty? ? "S" : "."
    elsif empty? 
      "M"
    elsif @ship.sunk?
      "X"
    else
      "H"
    end    
  end
end