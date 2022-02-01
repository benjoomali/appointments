require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "has email" do 
    assert_equal "ben@example.com", users(:one).email
  end
end
