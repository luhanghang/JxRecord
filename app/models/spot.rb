class Spot < ActiveRecord::Base
	belongs_to :gateway
	has_many :schedule_dailies
	has_many :schedule_weeklies
	has_many :action_dailies
	has_many :action_weeklies
	has_many :record_files
end
