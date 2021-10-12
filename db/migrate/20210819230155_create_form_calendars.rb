class CreateFormCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :form_calendars do |t|
      t.references :form, null: false, foreign_key: true
      t.references :calendar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
