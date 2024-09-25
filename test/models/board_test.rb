require "test_helper"

class BoardTest < ActiveSupport::TestCase
  test "should not save board without state" do
    board = Board.new
    assert_not board.save
  end
end
