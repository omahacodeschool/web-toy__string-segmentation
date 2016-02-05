require_relative '../lib/string_segmenter'
require_relative '../lib/dictionary'

MyApp.get "/string_segmenter" do
  @user_segmentation = Segment.new("  ")
  erb :"/string_segmenter"
end

class MyApp
  post '/user_input_string' do
   "#{@user_segmentation = Segment.new(params[:user_input]).final_words}"
  end
end