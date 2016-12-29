class Comment < ApplicationRecord
  belongs_to :item

  validates :body, presence: true
  validates :item_id, presence: true

end
