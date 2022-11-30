class Piece
  attr_accessor :board, :pos, :color

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end
end
