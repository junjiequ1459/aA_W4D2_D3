require_relative 'piece'

class Pawn < Piece

end


class Stepping_piece < Piece

end


class Sliding_piece < Piece

end


class Null_piece < Piece
    def initialize
        @name = 'nil'
    end
end
