class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.time :start_time
      t.time :end_time
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.integer :day_of_week
      t.references :calendar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
