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
end
