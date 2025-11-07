class Appointment < ApplicationRecord
  belongs_to :pet
  belongs_to :veterinarian
  validates :date, :status, presence: true
  enum status: { scheduled: 'scheduled', done: 'done', canceled: 'canceled' }
end

