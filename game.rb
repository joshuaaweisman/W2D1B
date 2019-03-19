require_relative 'board'
require_relative 'display'

class Game
  attr_reader :display, :board

  def initialize
    @board = Board.new
    @display = Display.new(board)
  end


  def move_cursor
    system("clear")
    display.render
    display.cursor.get_input
  end

end

game = Game.new

while true
  game.move_cursor
end