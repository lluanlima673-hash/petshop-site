class CreateVeterinarians < ActiveRecord::Migration[8.0]
  def change
    create_table :veterinarians do |t|
      t.string :name
      t.string :crm
      t.string :phone

      t.timestamps
    end
  end
end
