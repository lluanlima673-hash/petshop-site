class Veterinarian < ApplicationRecord
  has_many :appointments, dependent: :nullify
  validates :name, :crm, presence: true
  validates :crm, uniqueness: true
end
