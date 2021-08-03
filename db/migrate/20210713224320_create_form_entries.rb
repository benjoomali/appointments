class CreateFormEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :form_entries do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.references :form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
