require "turn"

RSpec.describe Turn do

    it "should start with X" do
      turn_object = Turn.new

      expect(turn_object.turn).to eq("X")
    end

    it "should switch turn after switch is called" do
      turn_object = Turn.new

      turn_object.switch_turn

      expect(turn_object.turn).to eq("O")
    end

end