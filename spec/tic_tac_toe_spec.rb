require 'game'
require 'output'


RSpec.describe TicTacToe do

  class TestInput
    def initialize(array=[])
      @array = array
      @i = -1
    end
  
    def get_integer
      @array[@i += 1].to_i
    end
  end  


  class TestOutput

    attr_reader :draw_result, :player1_win, :player1_wins, :player2_wins, :player1_win, :player2_win, :language_menu, :language, :welcome

    def initialize
      @draw_result = false
      @board = false
      @available_slots = false
      @player1_win = "Player 1 win"
      @player2_win = "Player 2 win"
      @player1_wins = false
      @player2_wins = false
      @winner = false
      @language_menu = false
      @language = false
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

    def display_player2_text
    end

    def get_player1_win_text
      @player1_win
    end

    def get_player2_win_text
      @player2_win
    end

    def display_language_menu
      @language_menu = true
    end

    def display_welcome_message
      @welcome = true
    end

    def display_winner(winner)
      if winner == @player1_win
        @player1_wins = true
      else
        @player2_wins = true
      end
    end

    def set_language(lang)
      @language = true
    end

  end


  before(:each) do
    @game = Game.new
    @output = TestOutput.new
    @test_input = TestInput.new(["7", "8"])
    @app = TicTacToe::Welcome.new(@game, @output, @test_input)

  end

    it "should expect welcome to have been called" do
      @app.welcome
      expect(@output.welcome).to be(true)
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

      expect(@output.player1_wins).to be(true)
    end

    it "should print out win for player2 when player2 wins" do
      @game.set_marks(
        ['X', 'O', 'O'],
        ['O', 'O', 'X'],
        ['',  '',  ''])
      @app.start_game

      expect(@output.player2_wins).to be(true)

    end

    context "language preferences" do
      it "should display the language menu" do
        @app.choose_language

        expect(@output.language_menu).to be(true)
      end

      it "should change the language during play" do
        test_input = TestInput.new(["7", "0", "1", "8"])
        app = TicTacToe::Welcome.new(@game, @output, test_input)
        @game.set_marks(
        ['X', 'O', 'O'],
        ['O', 'O', 'X'],
        ['',  '',  ''])
        app.start_game

        expect(@output.language_menu).to be(true)
        expect(@output.language).to be(true)
        expect(@output.player2_wins).to be(true)
      end

      it "should change the language multiple times during play" do
        test_input = TestInput.new(["7", "0", "1", "0", "2", "0", "3", "8"])
        app = TicTacToe::Welcome.new(@game, @output, test_input)
        @game.set_marks(
        ['X', 'O', 'O'],
        ['O', 'O', 'X'],
        ['',  '',  ''])
        app.start_game

        expect(@output.language_menu).to be(true)
        expect(@output.language).to be(true)
        expect(@output.player2_wins).to be(true)
      end
    end


end
