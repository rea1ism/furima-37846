class Destination < ApplicationRecord
  belongs_to :purchase

  # validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  # validates :prefecture_id, numericality: { other_than: 1, message: "must be selected" }
  # validates :city, presence: true
  # validates :street_number, presence: true
  # validates :phone_number, presence: true, format: {with: \A0[5789]0[-]?\d{4}[-]?\d{4}\z, message: "is invalid. Include hyphen(-)"}
end
