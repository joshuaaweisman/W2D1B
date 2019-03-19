require "byebug"
require_relative "piece"

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) {Array.new(8, nil)}
    populate
  end


  def populate
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        if row_idx < 2 || row_idx > 5
          @grid[row_idx][col_idx] = Piece.new([row_idx, col_idx])
        end
      end
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