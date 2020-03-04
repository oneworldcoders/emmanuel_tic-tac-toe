class Player

    attr_accessor :marker

    def initialize(marker = "X")
      @marker = marker
    end

    def play(position, game)
      index = position -= 1
      if game.state[index] == ""
        game.state[index] = marker
      end
    end
end
