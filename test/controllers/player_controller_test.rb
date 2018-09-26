require 'test_helper'

class PlayerControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get player_show_url
    assert_response :success
  end

end
