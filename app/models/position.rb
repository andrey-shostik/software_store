class Position < ApplicationRecord
  belongs_to :item
  belongs_to :cart

  validates :cart_id, :item_id, presence: true
end
