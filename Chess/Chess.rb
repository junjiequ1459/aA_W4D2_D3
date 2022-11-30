require_relative "piece"
require_relative "module"

class Pawn < Piece
  def moves
  end
end

# class Stepping_piece < Piece
#   def moves
#   end
# end

class Sliding_piece < Piece
  def move_dirs
  end
end

# class Null_piece < Piece
#   include Singleton

#   def initialize
#   end
# end

#Example
#Stepping_piece.new(:B,:Black,Board,[1,0])
