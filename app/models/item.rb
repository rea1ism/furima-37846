class Item < ApplicationRecord
  validates :item_name,              presence: true
  validates :description,            presence: true
  validates :category_id,            presence: true
  validates :status_id,              presence: true
  validates :transportation_cost_id, presence: true
  validates :prefecture_id,          presence: true
  validates :leadtime_id,            presence: true
  validates :price,                  presence: true

  belongs_to :user
end
