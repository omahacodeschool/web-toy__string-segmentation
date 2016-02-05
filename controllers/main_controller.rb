# The path being defined for this controller action is just "/", meaning 
# the root path. It's the homepage.
require_relative "../lib/string_segmenter"
require_relative "../lib/dictionary"

MyApp.get "/:string" do
  
  @test = StringSegmenter.new
  
  erb :"main/string_seg"
end

MyApp.get "/" do
  # If a GET request is made to the root path, the following line of code
  # looks for a .erb view file located in the 'views' directory at the given
  # location. So it's going to look for views/main/welcome.erb.
  # 
  # Then it will combine that view file with the layout file and sent the
  # combined document back to the client.
  erb :"main/welcome"
end
