require_relative 'slideable'
require_relative 'stepable'

class Piece
  attr_reader :position, :color, :board

  def initialize(position, color, board)
    @position = position
    @color = color
    @board = board
  end

  def valid_move?(pos)
    return false if pos[0] > 7 || pos[0] < 0
    return false if pos[1] > 7 || pos[1] < 0
    return false if board[pos] != nil
    true
  end

  def to_s
    @rep
  end

end



class Pawn < Piece

  def initialize(position, color, board)
    @rep = " ♙ "
    super
  end

  def move_dirs
    #
  end
end



class Queen < Piece
  include Slideable

  def initialize(position, color, board)
    @rep = " ♕ "
    super
  end

  def move_dirs
    all_dirs
  end
end



class King < Piece
  include Stepable

  def initialize(position, color, board)
    @rep = " ♔ "
    super
  end

  def move_dirs
    king_dirs
  end
end



class Rook < Piece
  include Slideable

  def initialize(position, color, board)
    @rep = " ♖ "
    super
  end

  def move_dirs
    horizontal_and_vertical_dirs
  end
end



class Bishop < Piece
  include Slideable

  def initialize(position, color, board)
    @rep = " ♗ "
    super
  end

  def move_dirs
    diagonal_dirs
  end
end



class Knight < Piece
  include Stepable

  def initialize(position, color, board)
    @rep = " ♘ "
    super
  end

  def move_dirs
    knight_dirs
  end
end