class Turn

    def initialize
      @turn = "X"
    end

    def get_turn
      @turn
    end

    def switch_turn
     @turn = @turn == "X" ? "O" : "X"
    end

end
