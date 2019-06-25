require 'test_helper'

class Api::V1::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test 'should show products' do
    get api_v1_products_url, as: :json
    assert_response :success

    json_response = JSON.parse(response.body, symbolize_names: true)
    assert_not_nil json_response.dig(:links, :first)
    assert_not_nil json_response.dig(:links, :last)
    assert_not_nil json_response.dig(:links, :next)
    assert_not_nil json_response.dig(:links, :prev)
  end

  test 'should show product' do
    get api_v1_product_url(@product), as: :json
    assert_response :success

    json_response = JSON.parse(response.body, symbolize_names: true)
    assert_equal @product.title, json_response.dig(:data, :attributes, :title)
    assert_equal @product.user.id.to_s, json_response.dig(:data, :relationships, :user, :data, :id)
    assert_equal @product.user.email, json_response.dig(:included, 0, :attributes, :email)
  end

  test 'should create product' do
    assert_difference('Product.count') do
      post api_v1_products_url,
           params: { product: { title: @product.title, price: @product.price, published: @product.published } },
           headers: { Authorization: JsonWebToken.encode(user_id: @product.user_id) },
           as: :json
    end
    assert_response :created
  end

  test 'should forbid create product' do
    assert_no_difference('Product.count') do
      post api_v1_products_url,
           params: { product: { title: @product.title, price: @product.price, published: @product.published } },
           as: :json
    end
    assert_response :forbidden
  end

  test 'should update product' do
    patch api_v1_product_url(@product),
          params: { product: { title: @product.title } },
          headers: { Authorization: JsonWebToken.encode(user_id: @product.user_id) },
          as: :json
    assert_response :success
  end

  test 'should forbid update product' do
    patch api_v1_product_url(@product),
          params: { product: { title: @product.title } },
          headers: { Authorization: JsonWebToken.encode(user_id: users(:two).id) },
          as: :json
    assert_response :forbidden
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete api_v1_product_url(@product), headers: { Authorization: JsonWebToken.encode(user_id: @product.user_id) }, as: :json
    end
    assert_response :no_content
  end

  test "should forbid destroy user" do
    assert_no_difference('Product.count') do
      delete api_v1_user_url(@product), headers: { Authorization: JsonWebToken.encode(user_id: users(:two).id) }, as: :json
    end
    assert_response :forbidden
  end
end
