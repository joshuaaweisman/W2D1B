module Stepable

  KNIGHT_DIRS = [
    [1,2],
    [1,-2],
    [-1,2],
    [-1,-2],
    [2,1],
    [2,-1],
    [-2,1],
    [-2,-1]
  ]

  KING_DIRS = [
    [1,1],
    [1,-1],
    [-1,1],
    [-1,-1],
    [1,0],
    [-1,0],
    [0,1],
    [0,-1]
  ]

  def knight_dirs
    KNIGHT_DIRS
  end

  def king_dirs
    KING_DIRS
  end


end