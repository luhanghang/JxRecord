class CreateRecordFiles < ActiveRecord::Migration
  def self.up
    create_table :record_files do |t|
      t.references :spot
      t.references :gateway
      t.date :record_date
      t.integer :start_hour
      t.integer :start_min
      t.integer :end_hour
      t.integer :end_min
      t.string :path_file
      t.integer :state, :default => 0
      t.string :error
      t.timestamps
    end
  end

  def self.down
    drop_table :record_files
  end
end
