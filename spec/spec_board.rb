require "./lib/board.rb"

describe Board do
  describe "#initialize" do
    it "creates a new board with 9 empty spaces" do
      board = Board.new
      expect(board.instance_variable_get(:@board)).to eql([" ", " ", " ", " ", " ", " ", " ", " ", " "])
    end
  end

  describe "#update" do
    it "updates the board with the player's move" do
      board = Board.new
      board.update(0, "X")
      expect(board.instance_variable_get(:@board)).to eql(["X", " ", " ", " ", " ", " ", " ", " ", " "])
    end
  end

  describe "#valid_move?" do
    it "returns true if the move is valid" do
      board = Board.new
      expect(board.valid_move?(0)).to eql(true)
    end

    it "returns false if the move is invalid" do
      board = Board.new
      board.update(0, "X")
      expect(board.valid_move?(0)).to eql(false)
    end
  end

  describe "#full?" do
    it "returns true if the board is full" do
      board = Board.new
      9.times { |i| board.update(i, "X") }
      expect(board.full?).to eql(true)
    end

    it "returns false if the board is not full" do
      board = Board.new
      8.times { |i| board.update(i, "X") }
      expect(board.full?).to eql(false)
    end
  end

  describe "#win?" do
    it "returns true if there is a winner" do
      board = Board.new
      board.update(0, "X")
      board.update(1, "X")
      board.update(2, "X")
      expect(board.win?).to eql(true)
    end

    it "returns false if there is no winner" do
      board = Board.new
      board.update(0, "X")
      board.update(1, "X")
      expect(board.win?).to eql(false)
    end
  end
end
