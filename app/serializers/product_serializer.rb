class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :price, :published
  belongs_to :user
  cache_options enabled: true, cache_length: 12.hours
end
