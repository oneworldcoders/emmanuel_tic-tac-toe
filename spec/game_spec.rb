RSpec.describe TicTacToe::Game do
    
    before(:each) do
        @game = TicTacToe::Game.new
        @player1 = TicTacToe::Player.new
        @player2 = TicTacToe::Player.new("O")
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

    it "returns a string representation of an empty board" do
        board_string = "|-||-||-|
                        |-||-||-|
                        |-||-||-|".split.join(' ')
        expect(@game.board_as_string.gsub("\n", ' ').squeeze(' ')).to eq(board_string)

    end

    context "Check Win" do

        context "Hoizontal Win" do
            it "should check for a win in the first row with X" do
                @game.set_marks(['X', 'X', 'X'],
                                ['',  '',  ''],
                                ['',  '',  ''])
                expect(@game.check_horizontal_win(@player1.get_mark)).to eq(true)
            end

            it "should return false for a draw in the first row" do
                @game.set_marks(['X', 'O', 'X'],
                                ['',  '',  ''],
                                ['',  '',  ''])
                expect(@game.check_horizontal_win(@player1.get_mark)).to eq(false)
            end

            it "should check for a win in the first row with O" do
                @game.set_marks(['O', 'O', 'O'],
                                ['',  '',  ''],
                                ['',  '',  ''])
                expect(@game.check_horizontal_win(@player2.get_mark)).to eq(true)
            end

            it "should return true for a win in the second row" do
                @game.set_marks(['',  '',  ''],
                                ['X', 'X', 'X'],
                                ['',  '',  ''])
                expect(@game.check_horizontal_win(@player1.get_mark)).to eq(true)
            end

        end


        context "Vertical Win" do
            it "should return true for a win in the first column for player1" do
                @game.set_marks(['X', '', ''],
                                ['X', '', ''],
                                ['X', '', ''])
                expect(@game.check_vertical_win(@player1.get_mark)).to eq(true)
            end

            it "should return false for a draw in the first column" do
                @game.set_marks(['X', '', ''],
                                ['O', '', ''],
                                ['X', '', ''])
                expect(@game.check_vertical_win(@player1.get_mark)).to eq(false)
            end

            it "should return true for a win in the first column for player 2" do
                @game.set_marks(['O', '', ''],
                                ['O', '', ''],
                                ['O', '', ''])
                expect(@game.check_vertical_win(@player2.get_mark)).to eq(true)
            end

            it "should return true for a win in second column for player 1" do
                @game.set_marks(['', 'X', ''],
                                ['', 'X', ''],
                                ['', 'X', ''])
                expect(@game.check_vertical_win(@player1.get_mark)).to eq(true)
            end
        end


        context "Diagonal Win" do
            it "should return true for a win for player 1 in the left 2 right diagonal" do
                @game.set_marks(['X', '', ''],
                                ['', 'X', ''],
                                ['', '', 'X'])
                expect(@game.check_diagonal_win(@player1.get_mark)).to eq(true)
            end

            it "should return false for a draw in the first diaginal" do
                @game.set_marks(['X', '', ''],
                                ['', 'O', ''],
                                ['', '', 'X'])
                expect(@game.check_diagonal_win(@player1.get_mark)).to eq(false)
            end

            it "should return true for a win for player 2 in the first diagonal" do
                @game.set_marks(['O', '', ''],
                                ['', 'O', ''],
                                ['', '', 'O'])
                expect(@game.check_diagonal_win(@player2.get_mark)).to eq(true)
            end

            it "should return true for a win for player 1 in the second diagonal" do
                @game.set_marks(['', '', 'X'],
                                ['', 'X', ''],
                                ['X', '', ''])
                expect(@game.check_diagonal_win(@player1.get_mark)).to eq(true)
            end
        end


        context "Check Draw" do

            describe "available moves" do
                it "should have all free slots initially" do
                    expect(@game.available_moves).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
                end

                it "shouldn't have an available slot after a play in that slot" do
                    @game.set_marks(['', '', 'X'],
                                    ['', 'X', ''],
                                    ['X', '', ''])
                    expect(@game.available_moves).to eq([1, 2, 4, 6, 8, 9])
                end
            end

            it "should have no available moves and win" do
                @game.set_marks(['X', 'X', 'O'],
                                ['O', 'O', 'X'],
                                ['X', 'O', 'X']  )

                expect(@game.check_win(@player1.get_mark)).to eq(false)
                expect(@game.check_win(@player2.get_mark)).to eq(false)
                expect(@game.available_moves).to eq([])
            end
        end

    end

end
