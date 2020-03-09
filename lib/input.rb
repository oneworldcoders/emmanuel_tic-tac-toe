class Input
  def initialize(array=[])
    @array = array
    @i = -1
  end

  def gets
    @i += 1
    @array[@i]
  end
end
