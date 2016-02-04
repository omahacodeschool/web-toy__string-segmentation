require 'test_helper'

class SSTest < Minitest::Test
  # These lines of code should not be edited. They add necessary
  # functionality for running our "acceptance tests".
  def app
    MyApp
  end

  The actual tests go below this comment.
  def test_welcome
    get "/"

    assert last_response.ok?

    assert_includes last_response.body, "Welcome!"
  end

  # def test_string
  #   random_string = "turtlebluecat"

  #   get "/#{random_string}"

  #   assert last_response.ok?

  #   assert_includes last_response.body, random_string
  # end

end






