require './lib/string_segmenter'
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

MyApp.get "/segmenter_form" do

    erb :"main/segmenter_form"
end 

MyApp.post "/segmenter_form" do

    x = String_Segmenter.new
    jumbled_string = params[:jumbled_string]
    x.set_str(jumbled_string)
    final = x.segment_string.join(" ")
    @segmented_string = final
    
    erb :"main/segmenter"
end 



