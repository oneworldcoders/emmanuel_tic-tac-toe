RSpec.describe TicTacToe do

    it "should expect welcome to have been called" do
      app = TicTacToe::Welcome.new

      expect(app).to receive(:welcome).with(no_args)
      app.welcome

    end 

end
