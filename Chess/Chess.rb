require_relative "piece"
require_relative "module"

class Rook < Piece
  include Slideable

  def move_dir
    horizontal_dirs
  end
end

class Bishop < Piece
  include Slideable

  def move_dir
    diagonal_dirs
  end
end

class Queen < Piece
  include Slideable

  def move_dir
    horizontal_dirs + diagonal_dirs
  end
end

class Knight
  def move_diff
    knight
  end
end

class King
  def move_diff
    king
  end
end

class Pawn
  def at_start_row?
    return true if pos[0] == 1 || pos[0] == 7
  end

  def forward_dir
    return 1 if color == :W
    -1
  end

  def moves
    if at_start_row?
      return [[pos[0] + forward_dir, pos[1]], [pos[0] + (forward_dir * 2), pos[1]]]
    else
      return [pos[0] + forward_dir, pos[1]]
    end
  end
end
