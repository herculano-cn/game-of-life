require "test_helper"

class BoardTest < ActiveSupport::TestCase
  test "should not save board with empty state" do
    board = Board.new(state: [])
    assert_not board.save
  end

  test "should save board with valid state" do
    board = Board.new(state: [[1, 0], [0, 1]])
    assert board.save
  end
end
