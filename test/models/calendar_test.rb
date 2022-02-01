require "test_helper"

class CalendarTest < ActiveSupport::TestCase
  test "valid if interval is between 0 and 1441" do
    calendar = Calendar.new(interval: 30)
    calendar.valid? 
    assert_empty calendar.errors[:interval]
  end

  test "invalid if interval is less than 1" do 
    calendar = Calendar.new(interval: -1)
    calendar.valid? 
    assert_not calendar.errors[:interval].empty?
  end 

  test "invalid if interval is greater than 1441" do 
    calendar = Calendar.new(interval: 1441)
    calendar.valid? 
    assert_not calendar.errors[:interval].empty?
  end 
end
