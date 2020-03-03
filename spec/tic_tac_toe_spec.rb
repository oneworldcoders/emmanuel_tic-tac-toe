RSpec.describe TicTacToe do

  describe TicTacToe::Player do

    it "should mark the first index with a play in position 1" do
      game = TicTacToe::Game.new
      player = TicTacToe::Player.new

      player.play(1, game)

      expect(game.state).to eq(['X', '', '', '', '', '', '', '', ''])
    end

  end

end
