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
    return false unless coordinates.length == ship.length
    return false unless coordinates.all? { |coordinate| validate_coordinate?(coordinate) } 
    return false unless consecutive_coordinates?(coordinates)
    return false if diagonal_coordinates?(coordinates)
    return false if overlapping_ships?(coordinates)

    true
  end

  def consecutive_coordinates?(coordinates)
    rows = coordinates.map { |coord| coord[0].ord }
    columns = coordinates.map { |coord| coord[1].to_i }

    consecutive_row = rows.uniq.length == 1 && consecutive_numbers?(columns)
    consecutive_column = columns.uniq.length == 1 && consecutive_numbers?(rows)

    consecutive_row || consecutive_column
  end

  def consecutive_numbers?(numbers)
    numbers.each_cons(2).all? { |a, b| b == a + 1 }
  end

  def diagonal_coordinates?(coordinates)
    rows = coordinates.map { |coord| coord[0] }
    columns = coordinates.map { |coord| coord[1].to_i }

    non_diagonal_rows = rows.uniq.length > 1
    non_diagonal_columns = columns.uniq.length > 1

    non_diagonal_rows && non_diagonal_columns
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
      # coordinates.each { |coordinate| @cells[coordinate].place_ship(ship)}
    end
  end

  def overlapping_ships?(coordinates)
    coordinates.any? { |coordinate| cells[coordinate].ship }
  end
end
