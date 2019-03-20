module Slideable

  HORIZONTAL_AND_VERTICAL_DIRS = [
    [0,1],
    [1,0],
    [-1,0],
    [0,-1]
  ]

  DIAGONAL_DIRS = [
    [1,1],
    [-1,-1],
    [1,-1],
    [-1,1]
  ]

  ALL_DIRS = [
    [0,1],
    [1,0],
    [-1,0],
    [0,-1],
    [1,1],
    [-1,-1],
    [1,-1],
    [-1,1]
  ]

  def horizontal_and_vertical_dirs
    HORIZONTAL_AND_VERTICAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def all_dirs
    ALL_DIRS
  end

  def moves
    moves = []
    multiplier = 1

    move_dirs.each do |dir|
      while true
        pot_diff = dir.map {|ele| ele * multiplier}
        pot_pos = [pot_diff[0] + position[0], pot_diff[1] + position[1]]
        if valid_move?(pot_pos)
          moves << pot_pos
          multiplier += 1
        else
          multiplier = 1
          break
        end
      end
    end

    moves
  end

end