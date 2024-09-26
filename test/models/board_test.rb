require "test_helper"

class BoardTest < ActiveSupport::TestCase
  # O método setup será chamado antes de cada teste
  setup do
    @initial_state = [[0, 1, 0], [0, 0, 1], [1, 1, 1]]
    @stable_state = [[1, 1, 0], [1, 1, 0], [0, 0, 0]]
    @board = Board.create(state: @initial_state)
  end

  test "should not save board with empty state" do
    board = Board.new(state: [])
    assert_not board.save
  end

  test "should save board with valid state" do
    board = Board.new(state: [[1, 0], [0, 1]])
    assert board.save
  end

  test "should return the current state of the board" do
    assert_equal @initial_state, @board.state
  end

  test "should compute next generation correctly" do
    next_state = @board.next_generation!

    expected_next_state = [[0, 0, 0], [1, 0, 1], [0, 1, 1]]
    assert_equal expected_next_state, next_state
  end

  test "should compute future states correctly" do
    future_state = @board.future_state!(2)
     
    expected_state = [[0, 0, 0], [0, 0, 1], [0, 1, 1]]
    assert_equal expected_state, future_state
  end

  test "should detect stable state and return final state" do
    board_with_stable_state = Board.create(state: @stable_state)
    
    final_state = board_with_stable_state.final_state!(10) 
    assert_equal @stable_state, final_state
  end
end
