require 'test_helper'

class Api::V1::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)

    @order_params = {
      order: {
        product_ids_and_quantities: [
          { product_id: products(:one).id, quantity: 2 },
          { product_id: products(:two).id, quantity: 3 },
        ]
      }
    }
  end

  test 'should forbid orders for unlogged' do
    get api_v1_orders_url, as: :json
    assert_response :forbidden
  end

  test 'should show orders' do
    get api_v1_orders_url, headers: { Authorization: JsonWebToken.encode(user_id: @order.user_id) }, as: :json
    assert_response :success

    json_response = JSON.parse(response.body, symbolize_names: true)
    assert_equal @order.user.orders.count, json_response[:data].count
    assert_json_response_is_paginated json_response
  end

  test 'should show order' do
    get api_v1_order_url(id: @order.id),
        headers: { Authorization: JsonWebToken.encode(user_id: @order.user_id) },
        as: :json
    assert_response :success

    json_response = JSON.parse(response.body)
    include_product_attr = json_response['included'][0]['attributes']
    assert_equal @order.products.first.title, include_product_attr['title']
  end

  test 'should forbid create order for unlogged' do
    assert_no_difference('Order.count') do
      post api_v1_orders_url, params: @order_params, as: :json
    end
    assert_response :forbidden
  end

  test 'should create order with two products and placements' do
    assert_difference('Order.count', 1) do
      assert_difference('Placement.count', 2) do
        post api_v1_orders_url,
            params: @order_params,
            headers: { Authorization: JsonWebToken.encode(user_id: @order.user_id) },
            as: :json
      end
    end
    assert_response :created
  end
end
