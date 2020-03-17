require_relative 'game'
require './lib/player'
require './lib/turn'
require './lib/output'
require './lib/input'
require './lib/language'
require 'json'


module TicTacToe

  class Tic_tac_toe

    MENU_CODE = 0

    def initialize (game=TicTacToe::Game.new, output=TicTacToe::Output.new, input=TicTacToe::Input.new)
      @game = game
      @player1 = Player.new("X")
      @player2 = Player.new("O")
      @turn = Turn.new
      @output = output
      @input = input
    end

    def welcome
      @output.display_welcome_message
    end

    def choose_language
      @output.display_language_menu
      @output.set_language(@input.get_integer)
    end

    def is_draw?(game)
      @output.display_board(game)
      @output.display_available_slots(game)
      if @game.available_moves == []
        @output.display_draw_result
        return true
      end
    end

    def start_game
      player = @player1
      until @game.check_win(player.get_mark) || is_draw?(@game) do

        if @turn.get_turn == 'X'
          @output.display_player1_text
          player = @player1
          win_text = @output.get_player1_win_text
        else
          @output.display_player2_text
          player = @player2
          win_text = @output.get_player2_win_text
        end
        
        i = @input.get_integer
        if i == MENU_CODE
          choose_language
        else
          player.play(i, @game)
        
          if @game.check_win(player.get_mark)
            @output.display_board(@game)
            @output.display_available_slots(@game)
            @output.display_winner(win_text)
          end
          @turn.switch_turn
        end

      end
    end
  end

end
