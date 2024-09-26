require 'test_helper'

class BoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board = boards(:one)
  end

  test "should create board" do
    post boards_url, params: { state: [[1,0], [0,1]] }, as: :json
    assert_response :created
  end

  test "should show board" do
    get board_url(@board), as: :json
    assert_response :success
  end

  test "should get next state" do
    get next_state_board_url(@board), as: :json
    assert_response :success
  end
end