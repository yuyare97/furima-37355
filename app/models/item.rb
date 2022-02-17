class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :scheduled_day

  validates :image, :name, :description, :price, presence: true
  validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :burden_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :scheduled_day_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000, message: "can't be blank" }
end
