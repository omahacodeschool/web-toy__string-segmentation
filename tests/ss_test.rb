require 'test_helper'
require 'str_seg'
require 'pry'

class SSTest < Minitest::Test
  # These lines of code should not be edited. They add necessary
  # functionality for running our "acceptance tests".
  def app
    MyApp
  end

  def test_string_segmentor
    
    random_string = "/iloveyou"
  
    get "/#{random_string}"

    assert last_response.ok?

    assert_includes last_response.body, "i love you"
    
  end
end






