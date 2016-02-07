# require 'string_segmenter'
require_relative "../lib/string_segmenter.rb"

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

MyApp.get "/words" do
  @string = SplitUpStringIntoWords.new
  if @string.segment_string(params[:string]) == nil
    erb :"main/error"
  else
    erb :"main/return_words"
  end
end

# MyApp.get "/words" do
#   @string = SplitUpStringIntoWords.new
#   @string.segment_string(params["string"])
#   # If a GET request is made to the root path, the following line of code
#   # looks for a .erb view file located in the 'views' directory at the given
#   # location. So it's going to look for views/main/welcome.erb.
#   # 
#   # Then it will combine that view file with the layout file and sent the
#   # combined document back to the client.
#   erb :"error/return_words"
# end

