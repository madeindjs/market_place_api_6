class Placement < ApplicationRecord
  belongs_to :order
  belongs_to :product

  after_create :decrement_product_quantity!

  def decrement_product_quantity!
    product.decrement!(:quantity, quantity)
  end
end
