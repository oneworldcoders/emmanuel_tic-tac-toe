require 'game'
require 'output'
require 'input'


RSpec.describe TicTacToe do

  before(:each) do
    @game = Game.new
    @output = Output.new
    @test_input = Input.new(["7", "8"])
    @app = TicTacToe::Welcome.new(@game, @output, @test_input)

  end

    it "should expect welcome to have been called" do
      expect(@app).to receive(:welcome).with(no_args)
      @app.welcome
    end

    it "should prints out draw message when the game is a draw" do
      @game.set_marks(
        ['X', 'O', 'X'],
        ['X', 'X', 'O'],
        ['O', 'X', 'O'])

      expect{@app.start_game}.to output(include(@output.draw_text)).to_stdout
    end

    it "should print out win for player1 when player1 wins" do
      @game.set_marks(
        ['X', 'O', 'X'],
        ['O', 'X', 'O'],
        ['',  '',  ''])

      expect {@app.start_game}. to output(include(@output.player1_win)).to_stdout
    end

    it "should print out win for player2 when player2 wins" do
      @game.set_marks(
        ['X', 'O', 'O'],
        ['O', 'O', 'X'],
        ['',  '',  ''])

      expect {@app.start_game}. to output(include(@output.player2_win)).to_stdout
    end


end
