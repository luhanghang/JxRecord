class CreateActionWeeklies < ActiveRecord::Migration
  def self.up
    create_table :action_weeklies do |t|
	  t.integer :action_type
	  t.references :schedule_weeklies
	  t.references :spot
	  t.references :gateway
      t.timestamps
    end
  end

  def self.down
    drop_table :action_weeklies
  end
end
