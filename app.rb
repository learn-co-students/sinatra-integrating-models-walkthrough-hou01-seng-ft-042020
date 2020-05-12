require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]

    @analyzed_text = TextAnalyzer.new(text_from_user)

    @word_count = @analyzed_text.count_of_words
    @vowel_count = @analyzed_text.count_of_vowels
    @con_count = @analyzed_text.count_of_consonants
    @most_commont = @analyzed_text.most_used_letter


    erb :results
  end
end
