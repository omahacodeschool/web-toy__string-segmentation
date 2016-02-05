require 'test_helper'

class SSTest < Minitest::Test
  # These lines of code should not be edited. They add necessary
  # functionality for running our "acceptance tests".
  def app
    MyApp
  end

  # The actual tests go below this comment.
  def test_welcome
    get '/'

    assert last_response.ok?

    assert_includes last_response.body, '<a href="/string_segmenter"'
  end

  def test_string_segmenter
    get '/string_segmenter'

    assert last_response.ok?

    assert_includes last_response.body, '<p>Available words: <br>'
  end

end






