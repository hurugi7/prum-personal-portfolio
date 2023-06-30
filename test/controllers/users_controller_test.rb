require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "should get show" do
    get user_path(@user)
    assert_response :success
  end
end
