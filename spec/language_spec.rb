require 'language'

RSpec.describe TicTacToe::Language do
    it "should set language" do
        language = TicTacToe::Language.new('en')

        language.set_language(2)
        expect(language.get_language).to eq('fr')
    end

    it "should load the default translation file" do
        language = TicTacToe::Language.new('en')

        expect(language.get_string('draw_text')).to eq('Draw')
    end

    it "should load a file from a different source" do
        fake_translation_file = {}
        fake_translation_file['fake'] = {}
        fake_translation_file['fake']['draw_text'] = 'Fake'

        language = TicTacToe::Language.new('fake', fake_translation_file)

        expect(language.get_string('draw_text')).to eq('Fake')
    end
end
