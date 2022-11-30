class Piece
  attr_accessor :board, :pos

  def initialize(symbol, color, board, pos)
    @symbol = symbol
    @color = color
    @board = board
    @pos = pos
  end
end
