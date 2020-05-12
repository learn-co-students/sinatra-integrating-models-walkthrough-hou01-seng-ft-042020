require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    # text_from_user = params[:user_text]
    # @analyzed_text = TextAnalyzer.new(text_from_user)
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @cw = @analyzed_text.count_of_words
    @cv = @analyzed_text.count_of_vowels
    @cc = @analyzed_text.count_of_consonants
    # @ml = @analyzed_text.most_used_letter
    @used = @analyzed_text.most_used_letter.keys[0].upcase
    @times =  @analyzed_text.most_used_letter.values[0]
    erb :results
  end
end
