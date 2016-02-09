require_relative "../lib/string_segmenter"

# The path being defined for this controller action is just "/", meaning 
# the root path. It's the homepage.
MyApp.get "/" do
  # If a GET request is made to the root path, the following line of code
  # looks for a .erb view file located in the 'views' directory at the given
  # location. So it's going to look for views/main/welcome.erb.
  # 
  # Then it will combine that view file with the layout file and sent the
  # combined document back to the client.
  erb :"main/welcome"
end

MyApp.get "/:str" do
  @words = StringSegmenter.new.segment_string(params[:str])
  erb :"main/show_words"
end


 MyApp.post "/main/show_words" do
  @words = StringSegmenter.new.segment_string(params[:string])
  erb :"main/show_words"
end