class Gateway < ActiveRecord::Base
	has_many :spots, :dependent => :destroy
	has_many :action_dailies
	has_many :action_weeklies
	has_many :record_files
end
