class CreateRemoveFile < ActiveRecord::Migration
  def self.up
    create_table :remove_files do |t|
      t.string 	:file
      t.timestamps
    end
  end

  def self.down
    drop_table :remove_files
  end
end
