RSpec.describe TicTacToe do

  describe TicTacToe::Player do

    it "should mark the first index with a play in position 1" do
      game = TicTacToe::Game.new
      player = TicTacToe::Player.new

      player.play(1, game)

      expect(game.state).to eq(['X', '', '', '', '', '', '', '', ''])
    end

    it "should cmark the first index with a play in position 4" do
      game = TicTacToe::Game.new
      player1 = TicTacToe::Player.new

      player1.play(4, game)

      expect(game.state).to eq(['', '', '', 'X', '', '', '', '', ''])
    end
  end


  describe TicTacToe::Turn do

    it "should start with X" do
      turn_object = TicTacToe::Turn.new

      expect(turn_object.turn).to eq("X")
    end

    it "should switch turn after switch is called" do
      turn_object = TicTacToe::Turn.new

      turn_object.switch_turn

      expect(turn_object.turn).to eq("O")
    end


  end


end
