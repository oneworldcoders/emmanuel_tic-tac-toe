class Game

  def initialize(state=Array.new(9, ""))
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

  def check_horizontal_win(mark)
    if(@state[0] == "X" && @state[1] == "X" && @state[2] == "X")
      true
    else
      false
    end
  end
end
