require 'test_helper'

class BoardsControllerTest < ActionDispatch::IntegrationTest
  
  test "should create board" do
    post boards_url, params: { state: [[1,0], [0,1]] }, as: :json
    assert_response :created
  end
end