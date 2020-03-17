module TicTacToe
    class Language
        
        def initialize(lang='en', language_data=JSON.parse(File.read(File.join(File.dirname(__FILE__), 'language.json'))))
            @lang = lang
            @language_data = language_data
        end

        def set_language(key)
            @lang = @language_data['language']["#{key}"]
        end

        def get_language
            @lang
        end

        def get_string(key)
            @language_data[@lang][key]
        end
    end
end
