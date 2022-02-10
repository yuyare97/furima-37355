class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_day

  validates :image, :name, :description, :price, presence: true
  validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :burden_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :scheduled_day_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :price, numericality: { greater_than: 299, less_than: 10_000_000, message: "can't be blank" }
  validates :price, format: { with: /[0-9]+\d/}, presence: true
end
