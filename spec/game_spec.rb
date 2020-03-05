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

    context "Check Win" do
        before(:each) do
            @player1 = Player.new
            @player2 = Player.new("O")
            @game = Game.new
        end

        context "Hoizontal Win" do
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

            it "should return true for a win in the second row" do
                for i in 4..6 do
                    @player1.play(i, @game)
                end

                expect(@game.check_horizontal_win(@player1.get_mark)).to eq(true)
            end

        end


        context "Vertical Win" do
            it "should return true for a win in the first column for player1" do
                i = 1
                while i <= 8
                    @player1.play(i, @game)
                    i += 3
                end
                expect(@game.check_vertical_win(@player1.get_mark)).to eq(true)
            end

            it "should return false for a draw in the first column" do
                @player1.play(1, @game)
                @player2.play(4, @game)
                @player1.play(7, @game)
                expect(@game.check_vertical_win(@player1.get_mark)).to eq(false)
            end

            it "should return true for a win in the first column for player 2" do
                i = 1
                while i <= 8
                    @player2.play(i, @game)
                    i += 3
                end
                expect(@game.check_vertical_win(@player2.get_mark)).to eq(true)
            end

            it "should return true for a win in second column for player 1" do
                i = 2
                while i <= 8
                    @player1.play(i, @game)
                    i += 3
                end
                expect(@game.check_vertical_win(@player1.get_mark)).to eq(true)
            end
        end


        context "Diagonal Win" do
            it "should return true for a win for player 1 in the left 2 right diagonal" do
                i = 1
                while i <= 9
                    @player1.play(i, @game)
                    i += 4
                end
                expect(@game.check_diagonal_win(@player1.get_mark)).to eq(true)
            end

            it "should return false for a draw in the first diaginal" do
                @player1.play(1, @game)
                @player2.play(5, @game)
                @player1.play(9, @game)
                expect(@game.check_diagonal_win(@player1.get_mark)).to eq(false)
            end

            it "should return true for a win for player 2 in the first diagonal" do
                i = 1
                while i <= 9
                    @player2.play(i, @game)
                    i += 4
                end
                expect(@game.check_diagonal_win(@player2.get_mark)).to eq(true)
            end
        end
    end

end
