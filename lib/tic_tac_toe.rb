require './lib/game'
require './lib/player'
require './lib/turn'
require './lib/output'


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

    def isDraw?(game)
      @output.display_board(game)
      @output.display_available_slots(game)
      if @game.available_moves == []
        @output.display_draw_result
        return true
      end
    end

    def start_game
      player = @player1
      while !@game.check_win(player.get_mark) && !isDraw?(@game) do

        if @turn.get_turn == 'X'
          @output.display_player1_text
          player = @player1
          win_text = @output.player1_win
        else
          @output.display_player2_text
          player = @player2
          win_text = @output.player2_win
        end
        i = @input.gets.chomp.to_i
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
