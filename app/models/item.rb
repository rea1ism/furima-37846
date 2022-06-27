class Item < ApplicationRecord
  validates :item_name,              presence: true
  validates :description,            presence: true
  validates :category_id,            numericality: { other_than: 1 }
  validates :status_id,              numericality: { other_than: 1 }
  validates :transportation_cost_id, numericality: { other_than: 1 }
  validates :prefecture_id,          numericality: { other_than: 1 }
  validates :leadtime_id,            numericality: { other_than: 1 }
  validates :price,                  presence: true, numericality: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }

  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :transportation_cost, :prefecture
end
