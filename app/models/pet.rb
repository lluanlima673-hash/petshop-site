class Pet < ApplicationRecord
  belongs_to :customer
  has_many :appointments, dependent: :destroy
  validates :name, :species, presence: true
end

