require 'test_helper'

class SSTest < Minitest::Test
  # These lines of code should not be edited. They add necessary
  # functionality for running our "acceptance tests".
  def app
    MyApp
  end

  # The actual tests go below this comment.
  def test_sample_string
    get '/speakersats'

    assert last_response.ok?

    assert_includes last_response.body, '["speak", "ersats"]'
  end

  def test_sample_string_2
    get '/speakthiswordordie'

    assert last_response.ok?

    assert_includes last_response.body, '["speak", "this", "word", "or", "die"]'
  end

  def test_empty_string
    get '/'

    assert last_response.ok?

    assert_includes last_response.body, nil
  end
end






