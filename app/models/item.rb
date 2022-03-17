class Item < ApplicationRecord

  has_many :order_details
  has_many :orders, through: :order_details
  has_many :order_details
  belongs_to :genre

  has_one_attached :image

  validates :name, presence: true
  validates :image, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

end
