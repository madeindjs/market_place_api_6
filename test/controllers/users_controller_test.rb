require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should show user" do
    get api_v1_user_url(@user), as: :json
    assert_response :success

    json_response = JSON.parse(self.response.body)
    assert_equal @user.email, json_response['email']
  end
end
