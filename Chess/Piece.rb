class Piece
  attr_accessor :board, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end
end
