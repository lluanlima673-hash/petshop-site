json.extract! appointment, :id, :pet_id, :veterinarian_id, :date, :description, :status, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
