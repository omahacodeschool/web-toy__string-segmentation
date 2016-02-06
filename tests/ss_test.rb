require 'test_helper'

class SSTest < Minitest::Test
  # These lines of code should not be edited. They add necessary
  # functionality for running our "acceptance tests".
  def app
    MyApp
  end

  # The actual tests go below this comment.
   def test_string_segmenter
    get '/string_segmenter/turtlebearlion'

    assert last_response.ok?

    assert_includes last_response.body, "turtle, bear, lion"
  end

  def test_links_on_homepage
    get '/'

    assert last_response.ok?

    assert_includes last_response.body, '<a href="/string_segmenter"'
  end

  def test_links_on_string_segmenter
    get '/string_segmenter'

    assert last_response.ok?

    assert_includes last_response.body, '<a href="/" >main</a>'
  end
  
end






