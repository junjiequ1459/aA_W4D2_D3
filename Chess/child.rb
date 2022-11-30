require_relative "piece"
require_relative "modules"

class Rook < Piece
  include Slideable

  def symbol
    "♖"
  end

  def move_dir
    horizontal_dirs
  end
end

class Bishop < Piece
  include Slideable

  def symbol
    "♗"
  end

  def move_dir
    diagonal_dirs
  end
end

class Queen < Piece
  include Slideable

  def symbol
    "♕"
  end

  def move_dir
    horizontal_dirs + diagonal_dirs
  end
end

class Knight < Piece
  def symbol
    "♘"
  end

  def move_diff
    knight
  end
end

class King < Piece
  def symbol
    "♔"
  end

  def move_diff
    king
  end
end

class Pawn < Piece
  def symbol
    "♙"
  end

  def at_start_row?
    return true if pos[0] == 1 || pos[0] == 7
  end

  def forward_dir
    return 1 if color == :W
    -1
  end

  def moves
    result = []
    if at_start_row?
      result << [[pos[0] + forward_dir, pos[1]], [pos[0] + (forward_dir * 2), pos[1]]]
    else
      result << [pos[0] + forward_dir, pos[1]]
    end

    if forward_dir == 1
      if board[pos[0] + 1, pos[1] - 1] != nil && board[pos[0] + 1, pos[1] - 1].color != self.color
        result << [pos[0] + 1, pos[1] - 1]
      end
      if board[pos[0] + 1, pos[1] + 1] != nil && board[pos[0] + 1, pos[1] + 1].color != self.color
        result << [pos[0] + 1, pos[1] + 1]
      end
    else
      if board[pos[0] - 1, pos[1] - 1] != nil && board[pos[0] - 1, pos[1] - 1].color != self.color
        result << [pos[0] - 1, pos[1] - 1]
      end
      if board[pos[0] - 1, pos[1] + 1] != nil && board[pos[0] - 1, pos[1] + 1].color != self.color
        result << [pos[0] - 1, pos[1] + 1]
      end
    end
    result
  end
end

# class NullPiece < Piece
#   include Singleton

#   def initialize
#     @color = :A
#     @symbol = " "
#   end

#   def moves
#   end
# end
