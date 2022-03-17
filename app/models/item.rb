class Item < ApplicationRecord

  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details
  belongs_to :genre

  has_one_attached :image_id

  validates :name, presence: true
  validates :image_id, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  
  def get_image_id
    (image_id.attached?) ? image_id : 'no_image.jpg'
  end
end
