class Customer < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_many :orders, dependent: :nullify
  validates :name, :email, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end

