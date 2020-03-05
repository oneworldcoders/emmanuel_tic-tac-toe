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
    i = 0
    while i <= 8
      if(@state[i] == mark && @state[i+1] == mark && @state[i+2] == mark)
        return true
      end
      i += 3
    end
    false
  end

  def check_vertical_win(mark)
    if(@state[0] == mark && @state[3] == mark && @state[6] == mark)
      return true
    end
    false
  end
end
