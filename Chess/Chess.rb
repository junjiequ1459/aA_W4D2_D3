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
    horizontal_dirs.concat(diagonal_dirs)
  end
end
