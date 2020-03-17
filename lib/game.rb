module TicTacToe
  class Game

    attr_accessor :state
    def initialize(state=Array.new(9, ''))
      @state = state
    end

    def set_mark(position, marker)
      index = position - 1
      @state[index] = marker
    end

    def get_mark_at(position)
      index = position - 1
      @state[index]
    end

    def set_marks(row1, row2, row3)
      0.upto(2) do |i|
        @state[i] = row1[i]
        @state[i + 3] = row2[i]
        @state[i + 6] = row3[i]
      end
    end

    def board_as_string
      string = ''
      @state.each_with_index do |spot, index|
        val = (spot != '') ? spot: "-"
        string += "|" + val.to_s + "|"
        if index == 2 || index == 5
          string += "\n"
        end
      end
      string
    end

    def check_horizontal_win(mark)
      @state.each_slice(3) do |row|
        if(row.uniq.count == 1 && row.first == mark)
          return true
        end
      end
      false
    end

    def check_vertical_win(mark)
      0.upto(2) do |i|
        if(@state[i] == mark && @state[i+3] == mark && @state[i+6] == mark)
          return true
        end
      end
      false
    end

    def check_diagonal_win(mark)
      if(@state[0] == mark && @state[4] == mark && @state[8] == mark)
        true
      elsif(@state[2]  == mark && @state[4] == mark && @state[6] == mark)
        true
      else
        false
      end
    end

    def check_win(mark)
      (check_diagonal_win(mark) || check_horizontal_win(mark) || check_vertical_win(mark))
    end

    def available_moves
      available_moves = []
      0.upto(8) do |i|
        if(@state[i] == "")
          available_moves.push(i + 1)
        end
      end
      available_moves
    end
  end
end
