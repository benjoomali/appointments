class CreateCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :calendars do |t|
      t.string :name
      t.text :description
      t.integer :interval
      t.references :user, null: false, foreign_key: true
      t.references :form, foreign_key: true

      t.timestamps
    end
  end
end
