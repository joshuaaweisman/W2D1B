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
      row.each_with_index do |square, square_idx|
        if row_idx == 0 || row_idx == 1 || row_idx == 6 || row_idx == 7
          @grid[row_idx][square_idx] = Piece.new([row_idx, square_idx])
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

end