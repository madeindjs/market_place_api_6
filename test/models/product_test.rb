require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "Should have a positive price" do
    product = products(:one)
    product.price = -1
    assert_not product.valid?
  end
end
