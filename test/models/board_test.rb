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


  test "should return the state x generations ahead" do
    board = Board.new(state: [[0, 1, 0], [0, 0, 1], [1, 1, 1]])
    future_state = board.future_state!(2)

    expected_future_state = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]

    assert_equal expected_future_state, future_state
  end
end
