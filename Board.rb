require_relative "Piece"

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, Piece.new("nil")) }
  end

  def [](pos)
    row, col = pos
    grid[row, col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row, col] = value
  end

  def move_piece(start_pos, end_pos)
    raise if self[start_pos] == nil || end_pos.all? { |ele| ele.between(0, 8) }
  end
end
