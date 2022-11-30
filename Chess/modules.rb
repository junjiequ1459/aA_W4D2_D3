module Slideable
  HORIZONTAL_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, 1], [-1, -1]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    result = []
    move_dir.each do |ele|
      result.concat(grow_unblocked_in_dir(ele[0], ele[1]))
    end
    result
  end

  protected

  def move_dir
    raise "error" if self.move_dir.method_defined?
  end

  def grow_unblocked_in_dir(dx, dy)
    pos_x = self.pos[0]
    pos_y = self.pos[1]
    result = []

    while pos_x.between?(0, 7) && pos_y.between?(0, 7)
      pos_x += dx
      pos_y += dy

      if board[pos_x, pos_y] != nil
        if board[pos_x, pos_y].color == self.color
          return result
        else
          result << [pos_x, pos_y]
          return result
        end
      end

      result << [pos_x, pos_y]
    end
    result
  end
end

module Stepable
  KNIGHT = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
  KING = [[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1]]

  def knight
    KNIGHT
  end

  def king
    KING
  end

  def move_diff
    raise "error" if self.move_dir.method_defined?
  end

  def moves
    result = []
    pos_x = self.pos[0]
    pos_y = self.pos[0]

    move_diff.each do |ele|
      if (pos_x + ele[0]).between?(0, 7) && (pos_y + ele[1]).between?(0, 7)
        if board[pos_x, pos_y] != nil
          if board[pos_x, pos_y].color == self.color
            return result
          else
            result << [pos_x, pos_y]
            return result
          end
        end
        result << [pos_x + ele[0], pos_y + ele[1]]
      end
    end
    result
  end
end
