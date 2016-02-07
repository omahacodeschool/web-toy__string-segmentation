require 'test_helper'

class SSTest < Minitest::Test
  # These lines of code should not be edited. They add necessary
  # functionality for running our "acceptance tests".
  def app
    MyApp
  end

  # The actual tests go below this comment.

  def test_onetwothree
    get '/onetwothree'
    assert last_response.ok?
    assert_includes last_response.body, '["one", "two", "three"]'
  end

  def test_onestwosthrees
    get '/onestwosthrees'
    assert last_response.ok?
    assert_includes last_response.body, '["ones", "twos", "threes"]'
  end

  def test_turtlebluecat
    get '/turtlebluecat'
    assert last_response.ok?
    assert_includes last_response.body, '["turtle", "blue", "cat"]'
  end

end