require 'test_helper'

class Api::V1::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = products(:one)
  end

  test 'should forbid orders for unlogged' do
    get api_v1_user_orders_url(user_id: @order.user_id), as: :json
    assert_response :forbidden
  end

  test 'should show orders' do
    get api_v1_user_orders_url(user_id: @order.user_id), headers: { Authorization: JsonWebToken.encode(user_id: @order.user_id) },  as: :json
    assert_response :success

    json_response = JSON.parse(response.body)
    assert_equal @order.user.orders.count, json_response['data'].count
  end
end
