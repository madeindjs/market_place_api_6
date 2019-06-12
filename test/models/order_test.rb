require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'Should have a positive total' do
    order = orders(:one)
    order.total = -1
    assert_not order.valid?
  end
end
