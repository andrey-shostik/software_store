class Cart < ApplicationRecord
  has_many   :positions, dependent: :destroy
  belongs_to :user
  has_many   :items, through: :positions, dependent: :destroy

  validates :user_id, presence: true, uniqueness: true
end
