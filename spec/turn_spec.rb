require "turn"

RSpec.describe Turn do

  before(:each) do
    @turn_object = Turn.new
  end

  it "should start with X's turn" do
    expect(@turn_object.get_turn).to eq("X")
  end

  it "should switch turn after switch is called" do
    @turn_object.switch_turn

    expect(@turn_object.get_turn).to eq("O")
  end

end
