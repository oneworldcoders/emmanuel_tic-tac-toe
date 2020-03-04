require "player"
require "game"


RSpec.describe Player do
    describe "A player making moves" do
        it "should mark the first index with a play in position 1" do
            game = Game.new
            player = Player.new
        
            player.play(1, game)
        
            expect(game.state).to eq(['X', '', '', '', '', '', '', '', ''])
        end
      
        it "should mark the first index with a play in position 4" do
            game = Game.new
            player1 = Player.new
        
            player1.play(4, game)
        
            expect(game.state).to eq(['', '', '', 'X', '', '', '', '', ''])
        end
    
        it "should play 'O' on second turn" do
            game = Game.new
            player1 = Player.new("X")
            player2 = Player.new("O")
        
            player1.play(1, game)
            player2.play(2, game)
        
            expect(game.state).to eq(['X', 'O', '', '', '', '', '', '', ''])
        end
    
        it "should not override a move" do
            game = Game.new
            player1 = Player.new("X")
            player2 = Player.new("O")
        
            player1.play(1, game)
            player2.play(1, game)
        
            expect(game.state).to eq(['X', '', '', '', '', '', '', '', ''])
        end
    end
end