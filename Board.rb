require_relative "piece"

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, nil) }
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
    raise 'no' if self[start_pos] == nil || end_pos.all? { |ele| ele.between?(0, 8) }
  end
end
