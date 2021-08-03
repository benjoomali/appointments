class CreateEntryAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :entry_appointments do |t|
      t.references :form_entry, null: false, foreign_key: true
      t.references :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
