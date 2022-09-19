class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :street_number, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "が不正です。ハイフンを入力してください" }
    validates :city
    validates :street_number
    validates :phone_number, numericality: { only_integer: true }, length: { in: 10..11 }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
