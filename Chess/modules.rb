module Slideable
  HORIZONTAL_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, 1], [-1, -1]]

  #logic determining horizontal or diagonal

  #if horizontal

  #rook
  #result = []
  #Horizontal.each do |ele|
  #
  #grow_unblocked_in_dir(ele)
  #
  def moves
    grow_unblocked_in_dir() # runs 4 times
  end

  def grow_unblocked_in_dir(dx, dy)

    #until out of bounds
    #keep adding 1 in the dy
    # [0,1] => [[0,2],[0,3],[0,4]]
  end
end

module Stepable
end
