require './lib/game'
require './lib/player'
require './lib/turn'
require './lib/output'
require './lib/input'


module TicTacToe

  class Welcome

    def initialize (game=Game.new, output=Output.new, input=STDIN)
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

    def start_game

      while true do
        @output.display_board(@game)
        @output.display_available_slots(@game)
        if @game.available_moves == []
          @output.display_draw_result
          break
        end

        @output.display_player1_text
        i = @input.gets.chomp.to_i
        @player1.play(i, @game)
        if @game.check_win(@player1.get_mark)
          @output.display_board(@game)
          @output.display_available_slots(@game)
          @output.display_player1_win
          break
        end
        @turn.switch_turn

        @output.display_board(@game)
        @output.display_available_slots(@game)
        if @game.available_moves == []
          @output.display_draw_result
          break
        end

        @output.display_player2_text
        i = @input.gets.chomp.to_i
        @player2.play(i, @game)
        if @game.check_win(@player2.get_mark)
          @output.display_board(@game)
          @output.display_available_slots(@game)
          @output.display_player2_win
          break
        end
        @turn.switch_turn

      end
    end
  end

end
