RSpec.describe TicTacToe::Player do
    describe "A player making moves" do

        before(:each) do
            @game = TicTacToe::Game.new
            @player1 = TicTacToe::Player.new
            @player2 = TicTacToe::Player.new("O")
        end

        it "should mark the first index with a play in position 1" do
            @player1.play(1, @game)
        
            expect(@game.get_mark_at(1)).to eq("X")
        end
      
        it "should mark the fourth index with a play in position 4" do
            @player1.play(4, @game)
        
            expect(@game.get_mark_at(4)).to eq("X")
        end
    
        it "plays 'O's for player 2" do
            @player1.play(1, @game)
            @player2.play(2, @game)
        
            expect(@game.get_mark_at(2)).to eq("O")
        end
    
        it "should not override a move" do
            position = 1
            @player1.play(position, @game)
            @player2.play(position, @game)
        
            expect(@game.get_mark_at(position)).to eq("X")
        end

        it "sets player1 marker to X" do
            expect(@player1.get_mark).to eq("X")
        end

        it "sets player2 marker to O on creation" do
            expect(@player2.get_mark).to eq("O")
        end
    end
end
