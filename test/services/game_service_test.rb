require 'test_helper'

class GameServiceTest < ActiveSupport::TestCase
  setup do
    @board = GameService.new([[0, 1, 0], [0, 0, 1], [1, 1, 1]])
  end

  test 'should return the next state of the board' do
    next_state = @board.next_state

    expected_next_state = [[0, 0, 0], [1, 0, 1], [0, 1, 1]]

    assert_equal expected_next_state, next_state
  end
end