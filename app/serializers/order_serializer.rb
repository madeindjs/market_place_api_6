class OrderSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :user
  has_many :products
end
