class CreateActionDailies < ActiveRecord::Migration
  def self.up
    create_table :action_dailies do |t|
      t.references :gateway
      t.references :spot
	  t.integer :action_type
	  t.references :schedule_dailies
      t.timestamps
    end
  end

  def self.down
    drop_table :action_dailies
  end
end
