require 'test_helper'

class SSTest < Minitest::Test
  # These lines of code should not be edited. They add necessary
  # functionality for running our "acceptance tests".
  def app
    MyApp
  end

  #Actual tests

  def test_ones_twos_threes
    get '/onestwosthrees'

    assert last_response.ok?

    assert_includes last_response.body, "ones twos threes"
  end

  def test_other
    get '/pavewalkedorigin'

    assert last_response.ok?

    assert_includes last_response.body, "pave walked origin"

  end
  
end






