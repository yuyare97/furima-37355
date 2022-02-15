class OrderBuyer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :address, :apartment_name, :phone_number

  validates :user_id
  validates :item_id
  validates :postcode, format: { with: /\A\d{3}-\d{4}\z/, message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :city
  validates :address
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "can't be blank"}

  def save
  end

end