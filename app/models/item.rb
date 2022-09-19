class Item < ApplicationRecord
  validates :item_name,              presence: true
  validates :description,            presence: true
  validates :category_id,            numericality: { other_than: 1, message: "を選択してください" }
  validates :status_id,              numericality: { other_than: 1, message: "を選択してください" }
  validates :transportation_cost_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :prefecture_id,          numericality: { other_than: 1, message: "を選択してください" }
  validates :leadtime_id,            numericality: { other_than: 1, message: "を選択してください" }
  validates :price,                  presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :image, presence: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :transportation_cost
  belongs_to :prefecture
  belongs_to :leadtime
end
