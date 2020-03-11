
class Output

    attr_reader :draw_text, :player1_win, :player2_win

    def initialize
      @draw_text = "Draw"
      @player1_win = "Player 1 is Winner"
      @player2_win = "Player 2 is Winner"
      @player1 = "\nPlayer 1: "
      @player2 = "\nPlayer 2: "
      @available_moves_text = "\n\nAvailable moves: "
      @welcome_message = 'Welcome to Tic Tac Toe!
      ---------------- Rules ---------------------
      There are 2 players.
      Player 1 starts and his mark is X
      Player 2 then plays next with O

      The available moves are printed out to show the pool of
      moves left for the players to pick from

      The first to make 3 in a row wins
      --------------------------------------------
      '

    end

    def display_welcome_message
      puts @welcome_message
    end

    def display_draw_result
      puts STR[:draw_text]
    end

    def display_player1_text
      print @player1
    end

    def display_player2_text
      print @player2
    end

    def display_winner(winner)
      puts winner
    end

    def display_board(game)
      puts game.board_as_string
    end

    def display_available_slots(game)
      puts @available_moves_text + game.available_moves.to_s
    end
end
