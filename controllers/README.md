# Controllers
##Kyle put stuff here

Controllers are files in which we define "controller actions", which dictate what code to run when requests are made.

In this Web framework, routes are defined alongside their related controller action.

## Examples and Meaning

An example controller action might be:

```ruby
get "/login" do
  erb :"main/user_login/new"
end
```

This action says two things:

1. Run this action if a `GET` request to `"/login"` is made.
2. Find the view file located at **views/main/user_login/new.erb**, and send that back (after combining it with a layout wrapper file).

Another, slightly more detailed example:

```ruby
get "/timeline" do
  @events = Event.all
  erb :"events/view_all"
end
```
This action says three things:

1. Run this action if a `GET` request to `"/timeline"` is made.
2. Set an instance variable `@events` equal to a collection of all of the events in the database.
3. Find the view file located at **views/events/view_all.erb**, and send that back (after combining it with a layout wrapper file).

The `@events` variable is probably being used in the view file to display some content for each event in the collection. (If it isn't, then defining it in this controller action doesn't accomplish anything.)

## File Structure

You can create new controller files here, in this **controllers/** directory any time. Having just one controller versus several does not provide less or more functionality. Multiple controller files is simply a way of organizing controller actions.

All of the Ruby files in this **controllers/** directory are being `require`d in **../main.rb**. You can look at that file now to see, if you want.