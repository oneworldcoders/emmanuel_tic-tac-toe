module TicTacToe

  class Player
    def play(position, game)
      index = position -= 1
      game.state[index] = "X"
    end
      
  end

  class Game

    attr_accessor :state

    def initialize(state=['', '', '', '', '', '', '', '', ''])
      @state = state
    end

  end

end
