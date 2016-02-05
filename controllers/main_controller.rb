require './lib/string_segmenter'

# The path being defined for this controller action is just "/", meaning 
# the root path. It's the homepage.
MyApp.get "/" do
  # If a GET request is made to the root path, the following line of code
  # looks for a .erb view file located in the 'views' directory at the given
  # location. So it's going to look for views/main/welcome.erb.
  # 
  # Then it ill combine that view file with the layout file and sent the
  # combined document back to the client.
  str = "onetwothree"
  segment_string(str)
  erb :"main/welcome"
end

# need to make a method that gets the user's string
# the string will be from the url

MyApp.get "/:user_input" do
  erb :"main/welcome"
end

