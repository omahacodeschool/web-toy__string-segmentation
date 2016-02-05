require_relative "../lib/animal"
require_relative "../lib/string_segmenter"

# The path being defined for this controller action is just "/", meaning 
# the root path. It's the homepage.
# This is a controller action.
MyApp.get "/" do
  # If a GET request is made to the root path, the following line of code
  # looks for a .erb view file located in the 'views' directory at the given
  # location. So it's going to look for views/main/welcome.erb.
  # 
  # Then it ill combine that view file with the layout file and sent the
  # combined document back to the client.
  @dog = Dog.new
  @wss = WebStringSegmenter.new
  erb :"main/welcome"
end


MyApp.get "/:random" do
  @dog = Dog.new
  @wss = WebStringSegmenter.new
  erb :"main/welcome"
end

# need to make a method that gets the user's string
# the string will be from the url

