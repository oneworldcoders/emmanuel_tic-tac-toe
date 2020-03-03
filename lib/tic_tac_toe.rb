module TicTacToe

  class Player

    attr_accessor :marker

    def initialize(marker = "X")
      @marker = marker
    end

    def play(position, game)
      index = position -= 1
      game.state[index] = marker
    end
  end


  class Game

    attr_accessor :state

    def initialize(state=['', '', '', '', '', '', '', '', ''])
      @state = state
    end
  end


  class Turn

    attr_accessor :turn

    def initialize
      @turn = "X"
    end

    def switch_turn
     @turn = @turn == "X" ? "O" : "X"
    end
  end

end
