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
    if(@state[0] == mark && @state[1] == mark && @state[2] == mark)
      true
    else
      false
    end
  end
end
