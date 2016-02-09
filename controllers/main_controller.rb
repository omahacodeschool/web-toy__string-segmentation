require_relative "../lib/string_segmenter"
require_relative "../lib/dictionary"

MyApp.get "/segment" do
  test = StringSegmenter.new
  @words = test.run_string_segmenter(params["string_to_segment"])
  
  erb :"main/results"
end

MyApp.get "/try_segmenter" do
  
  erb :"main/try_segmenter"
end
#MyApp.post "/segment" do
#  string = params[:string] || "Error Please enter text Error"
  
#  @test = StringSegmenter.new
  
#  erb :index, :locals => {'string' => string}
#end


MyApp.get "/about" do

  erb :"main/about"
end

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




