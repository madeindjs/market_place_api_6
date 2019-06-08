require 'test_helper'

class Api::V1::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should show products" do
    get api_v1_products_url(), as: :json
    assert_response :success
  end

  test "should show product" do
    get api_v1_product_url(@product), as: :json
    assert_response :success

    json_response = JSON.parse(self.response.body)
    assert_equal @product.title, json_response['title']
  end
end
