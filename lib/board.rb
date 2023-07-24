class Board
  attr_reader :cells

  def initialize
    @cells = {}
    generate_cells
  end

  def generate_cells
    cells = ["A1", "A2", "A3" , "A4", "B1", "B2", "B3" , "B4", "C1", "C2", "C3" , "C4", "D1", "D2", "D3" , "D4" ]
    cells.each do |coordinate|
      @cells[coordinate] = Cell.new(coordinate)
    end
  end

  def validate_coordinate?(coordinate)
    cells.key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    coordinates == ship.length
  end

  def consecutive_coordinates?(coordinates)
    rows = coordinate.map { |coord| coord(1..4) }
    columns = coordinate.map { |coord| coord(1..4) }
    

    end

  end
end


#Horizontal, Vertical, fit in the grid,
#if occupied, enough coordinates
#def empty?(helper method)
# # of coordinates match the length of the ship, make sure it's not occupied
#if not valid, it's occupied, off the board
#consecutive placement- validation must be aware of horizontal or vertical placement.
#