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



#{}```ruby
#get "/timeline" do
#  @events = Event.all
#  erb :"events/view_all"
#end
#{}```
#This action says three things:

#1. Run this action if a `GET` request to `"/timeline"` is made.
#2. Set an instance variable `@events` equal to a collection of all of the events in the database.
#3. Find the view file located at **views/events/view_all.erb**, and send that back (after combining it with a layout wrapper file).

#The `@events` variable is probably being used in the view file to display some content for each event in the collection. (If it isn't, then defining it in this controller action doesn't accomplish anything.)