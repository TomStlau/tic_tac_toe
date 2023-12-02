class Board
  def initialize
    @board = Array.new(9, ' ')
  end

  def display
    @board.each_slice(3).with_index do |row, i|
      puts row.map.with_index { |cell, j| cell == ' ' ? i * 3 + j + 1 : cell }.join(' | ')
      puts '--+---+---' unless i == 2
    end
  end

  def update(position, player)
    @board[position] = player
  end

  def valid_move?(position)
    @board[position] == ' '
  end

  def full?
    @board.none? { |cell| cell == ' ' }
  end

  def win?
    win_conditions = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # columns
      [0, 4, 8], [2, 4, 6]  # diagonals
    ]

    win_conditions.any? do |condition|
      ['X', 'O'].any? do |player|
        condition.all? { |i| @board[i] == player }
      end
    end
  end
end
