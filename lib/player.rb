module TicTacToe
  class Player

      def initialize(marker = "X")
        @marker = marker
      end

      def get_mark
        @marker
      end

      def play(position, game)
        if game.get_mark_at(position) == ""
          game.set_mark(position, @marker)
        end
      end
  end
end
