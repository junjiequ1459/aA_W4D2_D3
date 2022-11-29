require_relative "Piece"

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) {nil} }
    # @null_piece = Null_piece.new
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  def move_piece(start_pos, end_pos)
    raise "no" if !end_pos.all? { |ele| ele.between?(0, 8) } #[0, 2]
    #self[start_pos] == nil || 
    self[end_pos] = self[start_pos]
    self[start_pos] = nil 
    # start pos = null piece
    #end pos = Piece
  end

  private

  attr_accessor :null_piece
end
