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
    y = self.pos[0]
    x = self.pos[1]
    result = []

    while y.between?(0, 7) && x.between?(0, 7)
      y += dx
      x += dy

      if board[y, x] != nil
        if board[y, x].color == self.color
          return result
        else
          result << [y, x]
          return result
        end
      end

      result << [y, x]
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
    y = self.pos[0]
    x = self.pos[0]

    move_diff.each do |ele|
      if (y + ele[0]).between?(0, 7) && (x + ele[1]).between?(0, 7)
        if board[y, x] != nil
          if board[y, x].color == self.color
            return result
          else
            result << [y, x]
            return result
          end
        end
        result << [y + ele[0], x + ele[1]]
      end
    end
    result
  end
end
