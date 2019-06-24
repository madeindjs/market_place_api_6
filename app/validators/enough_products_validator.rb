# app/validators/enough_products_validator.rb
class EnoughProductsValidator < ActiveModel::Validator
  def validate(record)
    record.placements.each do |placement|
      product = placement.product
      if placement.quantity > product.quantity
        record.errors[product.title.to_s] << "Is out of stock, just #{product.quantity} left"
      end
    end
  end
end
