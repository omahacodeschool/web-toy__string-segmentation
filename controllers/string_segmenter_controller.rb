require_relative '../lib/string_segmenter'
require_relative '../lib/dictionary'

MyApp.get "/string_segmenter" do
  @user_segmentation = Segment.new("  ")
  erb :"/string_segmenter"
end

