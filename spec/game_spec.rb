require "game"
require "player"

RSpec.describe Game do

    before(:each) do
        @game = Game.new
    end

    it "sets a mark" do
        @game.set_mark(1, "X")
        
        expect(@game.get_mark_at(1)).to eq("X")
    end

    it "sets an 'O' mark at position 5" do
        @game.set_mark(5, "O")

        expect(@game.get_mark_at(5)).to eq("O")
    end

    it "sets multple marks" do
        @game.set_mark(1, "X")
        @game.set_mark(3, "O")

        expect(@game.get_mark_at(1)).to eq("X")
        expect(@game.get_mark_at(3)).to eq("O")
    end

    it "fills up the board" do
        9.times do |i|
            @game.set_mark(i+1, "X")
            expect(@game.get_mark_at(i+1)).to eq("X")
        end
    end

    context "Hoizontal Win" do

        before(:each) do
            @player1 = Player.new
            @player2 = Player.new("O")
            @game = Game.new
        end

        it "should check for a win in the first row with X" do
            for i in 1..3 do
                @player1.play(i, @game)
            end

            expect(@game.check_horizontal_win(@player1.get_mark)).to eq(true)
        end

        it "should return false for a draw in the first row" do
            @player1.play(1, @game)
            @player2.play(2, @game)
            @player1.play(3, @game)

            expect(@game.check_horizontal_win(@player1.get_mark)).to eq(false)
        end

        it "should check for a win in the first row with O" do
            for i in 1..3 do
                @player2.play(i, @game)
            end

            expect(@game.check_horizontal_win(@player2.get_mark)).to eq(true)
        end
    end

end
