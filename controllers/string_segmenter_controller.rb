require_relative '../lib/string_segmenter.rb'
require_relative '../lib/dictionary.rb'

MyApp.get "/string_segmenter" do
  @segment_input = Segment.new("cattrancerun")
  @current_dictionary = available_words()
  erb :"/string_segmenter"
end