require_relative "piece"
require_relative "child"

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { nil } }
    self.init_board

    # self.init_board
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

  def init_board
    #white
    for i in 0..1
      for j in 0..7
        pos = [i, j]
        while i != 1
          if j == 0 || 7
            self[pos] = Rook.new(:W, self, [i, j])
          elsif j == 1 || 6
            self[pos] = Knight.new(:W, self, [i, j])
          elsif j == 2 || 5
            self[pos] = Bishop.new(:W, self, [i, j])
          elsif j == 1 || 6
            self[pos] = Queen.new(:W, self, [i, j])
          else
            self[pos] = King.new(:W, self, [i, j])
          end
        end
        self[pos] = Pawn.new(:W, self, [i, j])
      end
    end
    #Black
    for i in 6..7
      for j in 0..7
        pos = [i, j]
        while i != 1
          if j == 0 || 7
            self[pos] = Rook.new(:B, self, [i, j])
          elsif j == 1 || 6
            self[pos] = Knight.new(:B, self, [i, j])
          elsif j == 2 || 5
            self[pos] = Bishop.new(:B, self, [i, j])
          elsif j == 1 || 6
            self[pos] = King.new(:B, self, [i, j])
          else
            self[pos] = Queen.new(:B, self, [i, j])
          end
        end
        self[pos] = Pawn.new(:B, self, [i, j])
      end
    end
  end

  attr_accessor :null_piece
end
