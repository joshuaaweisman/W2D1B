require "colorize"
require "colorized_string"
require_relative "cursor"

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end


  def render
    board.grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        background = :cyan if (row_idx + col_idx).even?
        background = :magenta if (row_idx + col_idx).odd?

        if [row_idx, col_idx] != cursor.cursor_pos
          print "   ".colorize(:background => background)
        else
          print "   ".colorize(:background => :yellow)
        end
      end
      puts
    end
  end
  
end

