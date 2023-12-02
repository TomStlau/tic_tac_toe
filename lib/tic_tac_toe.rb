require_relative 'board'

class Game
  def initialize
    @board = Board.new
    @current_player = 'X'
  end

  def switch_player
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end

  def play
    until game_over?
      @board.display
      move = get_move
      @board.update(move, @current_player)
      if @board.win?
        puts "Player #{@current_player} wins!"
        return
      end
      switch_player
    end
    @board.display
    puts "It's a draw!"
  end

  def get_move
    while true
      puts "Player #{@current_player}, enter your move (1-9):"
      move = gets.chomp.to_i - 1
      if valid_move?(move)
        return move
      else
        puts "Invalid move. Try again."
      end
    end
  end

  def valid_move?(move)
    move.between?(0, 8) && @board.valid_move?(move)
  end

  def game_over?
    @board.full? || @board.win?
  end
end

game = Game.new
game.play
