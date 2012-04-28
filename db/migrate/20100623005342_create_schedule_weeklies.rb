class CreateScheduleWeeklies < ActiveRecord::Migration
  def self.up
    create_table :schedule_weeklies do |t|
      t.references :spot
      t.integer :week_day
      t.integer :start_hour
      t.integer :start_min
      t.integer :end_hour
      t.integer :end_min
      t.integer :last_time
      t.integer :enabled
      t.integer :state, :default => 0
      t.integer :color, :default => -1
      t.timestamps
    end
  end

  def self.down
    drop_table :schedule_weeklies
  end
end
