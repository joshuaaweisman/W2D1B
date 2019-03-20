require "byebug"
require_relative "piece"
require_relative "nullpiece"

class Board

  ROW_OF_PIECES = [:rook, :knight, :bishop, :queen, :king, :bishop, :knight, :rook]

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) {Array.new(8, NullPiece.instance)}
    populate
  end


  def populate
    grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        color = :white
        color = :black if row_idx > 1

        if row_idx == 0 || row_idx == 7
          @grid[row_idx][col_idx] = create_piece(ROW_OF_PIECES[col_idx], [row_idx, col_idx], color)
        end

        if row_idx == 1 || row_idx == 6
          @grid[row_idx][col_idx] = Pawn.new([row_idx, col_idx], color, self)
        end
      end
    end



    # @grid.each_with_index do |row, row_idx|
    #   row.each_with_index do |col, col_idx|
    #     if row_idx < 2 || row_idx > 5
    #       @grid[row_idx][col_idx] = Piece.new([row_idx, col_idx], :white, self)
    #     end
    #   end
    # end
  end

  def create_piece(piece, pos, color)
    case piece
    when :rook
      Rook.new(pos, color, self)
    when :knight
      Knight.new(pos, color, self)
    when :bishop
      Bishop.new(pos, color, self)
    when :queen
      Queen.new(pos, color, self)
    when :king
      King.new(pos, color, self)
    end
  end


  def move_piece(start_pos, end_pos)
    row1, col1 = start_pos
    row2, col2 = end_pos

    if @grid[row1][col1] == nil
      raise "There's not a piece in that space, pal!"
    elsif @grid[row2][col2] != nil
      raise "That space is occupied, guy!"  
    else
      @grid[row2][col2] = @grid[row1][col1]
      @grid[row1][col1] = nil
    end

  end


  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end


  def [](pos)
    @grid[pos[0]][pos[1]]
  end


  def valid_pos?(pos)
    return false if pos[0] > 7 || pos[0] < 0
    return false if pos[1] > 7 || pos[1] < 0
    true
  end

end