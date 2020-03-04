class Turn

    attr_accessor :turn

    def initialize
      @turn = "X"
    end

    def switch_turn
     @turn = @turn == "X" ? "O" : "X"
    end

end
