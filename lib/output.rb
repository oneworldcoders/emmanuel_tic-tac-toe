module TicTacToe
  class Output

    def initialize(lang=TicTacToe::Language.new)
      @lang = lang
    end

    def set_language(lang)
      @lang.set_language(lang)
    end

    def display_welcome_message
      puts @lang.get_string('welcome_message')
    end

    def display_draw_result
      puts @lang.get_string('draw_text')
    end

    def display_player1_text
      print @lang.get_string('player1')
    end

    def get_player1_win_text
      @lang.get_string('player1_win')
    end

    def get_player2_win_text
      @lang.get_string('player2_win')
    end

    def display_player2_text
      print @lang.get_string('player2')
    end

    def display_winner(winner)
      puts winner
    end

    def display_board(game)
      puts game.board_as_string
    end

    def display_available_slots(game)
      puts @lang.get_string('available_moves') + game.available_moves.to_s
    end

    def display_language_menu
      puts @lang.get_string('language_options')
    end
  end
end
