require 'game'
require 'output'


RSpec.describe TicTacToe do

  class TestInput
    def initialize(array=[])
      @array = array
      @i = -1
    end
  
    def gets
      @array[@i += 1]
    end
  end  

  class TestOutput

    attr_reader :draw_result

    def initialize
      @draw_result = false
      @board = false
      @available_slots = false
    end

    def display_draw_result
      @draw_result = true
    end

    def display_board(game)
      @board = true
    end

    def display_available_slots(game)
      @available_slots = true
    end

    def display_player1_text
    end
  end

  before(:each) do
    @game = Game.new
    @output = TestOutput.new
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
      @app.start_game

      expect(@output.draw_result).to be(true)
    end

    it "should print out win for player1 when player1 wins" do
      @game.set_marks(
        ['X', 'O', 'X'],
        ['O', 'X', 'O'],
        ['',  '',  ''])
      @app.start_game

      expect(@output.player1_win).to be(true)
    end

    xit "should print out win for player2 when player2 wins" do
      @game.set_marks(
        ['X', 'O', 'O'],
        ['O', 'O', 'X'],
        ['',  '',  ''])

      expect {@app.start_game}. to output(include(@output.player2_win)).to_stdout
    end


end
