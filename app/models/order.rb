class Order < ApplicationRecord
  belongs_to :user
  has_many :placements, dependent: :destroy
  has_many :products, through: :placements

  validates :total, numericality: { greater_than_or_equal_to: 0 }
  validates :total, presence: true
end
