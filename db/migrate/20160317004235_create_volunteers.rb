class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :insurance_carrier
      t.string :medical_id

      t.timestamps null: false
    end
  end
end
