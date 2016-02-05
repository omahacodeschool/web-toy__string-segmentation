# The path being defined for this controller action is just "/", meaning 
# the root path. It's the homepage.
MyApp.get "/" do
  erb :"main/welcome"
end

# posts form data from view/string_segmenter.erb to /user_input_string.erb
# @user_segmentation: instance of the Segment class in lib/string_segmenter.rb
## passes :user_input form data as an arguement via params. 
class MyApp

  post '/user_input_string' do
  @user_segmentation = Segment.new(params[:user_input])
  erb :"/user_input_string"
  end

end