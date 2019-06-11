class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :price, :published
  belongs_to :user
end
