class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.references :pet, null: false, foreign_key: true
      t.references :veterinarian, null: false, foreign_key: true
      t.datetime :date
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
