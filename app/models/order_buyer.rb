class OrderBuyer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :address, :apartment_name, :phone_number, :token


  validates :token, presence: true
  validates :user_id, presence:true
  validates :item_id, presence:true
  validates :postcode, format: { with: /\A\d{3}-\d{4}\z/, message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :city, presence:true
  validates :address, presence:true
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "can't be blank"}
  
  

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create(postcode: postcode, prefecture_id: prefecture_id, city: city, address: address, apartment_name: apartment_name,
    phone_number: phone_number, order_id: order.id)
  end

end