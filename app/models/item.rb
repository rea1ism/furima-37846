class Item < ApplicationRecord
  validates :item_name,              presence: true
  validates :description,            presence: true
  validates :category_id,            numericality: { other_than: 1 }
  validates :status_id,              presence: true
  validates :transportation_cost_id, presence: true
  validates :prefecture_id,          presence: true
  validates :leadtime_id,            presence: true
  validates :price,                  presence: true, numericality: { in: 300..9999999}, format: { with: /\A[0-9]+\z/ }

  belongs_to :user
  has_one_attached :image

  validates :image, presence: { message: 'をアップロードしてください' }
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :transportation_cost, :prefecture
end
