require "./lib/tic_tac_toe.rb"

describe Game do
  let(:game) { Game.new }

  before do
    allow(game).to receive(:get_move).and_return(0)
  end

  describe "#initialize" do
    it "creates a new game with a board and a current player" do
      expect(game.instance_variable_get(:@board)).to be_a(Board)
      expect(game.instance_variable_get(:@current_player)).to eql("X")
    end
  end

  describe "#switch_player" do
    it "switches the current player" do
      game.switch_player
      expect(game.instance_variable_get(:@current_player)).to eql("O")
    end
  end

  describe "#valid_move?" do
    it "returns true if the move is valid" do
      expect(game.valid_move?(0)).to eql(true)
    end

    it "returns false if the move is invalid" do
      game.instance_variable_get(:@board).update(0, "X")
      expect(game.valid_move?(0)).to eql(false)
    end
  end

  describe "#game_over?" do
    it "returns true if the game is over" do
      game.instance_variable_get(:@board).update(0, "X")
      game.instance_variable_get(:@board).update(1, "X")
      game.instance_variable_get(:@board).update(2, "X")
      expect(game.game_over?).to eql(true)
    end

    it "returns false if the game is not over" do
      game.instance_variable_get(:@board).update(0, "X")
      game.instance_variable_get(:@board).update(1, "X")
      expect(game.game_over?).to eql(false)
    end
  end
end
