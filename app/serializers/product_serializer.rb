class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :price, :published
end
