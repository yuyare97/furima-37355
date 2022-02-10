class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :orders

  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, presence: true


  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}, presence: true

  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}, presence: true

  validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ン]+\z/}, presence: true
end
