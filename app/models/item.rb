class Item < ApplicationRecord
  has_many :positions, dependent: :destroy
  has_many :carts, through: :positions, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, :price, presence: true
  validates :price, numericality: { greater_than: 0, allow_nil: true }
end
