class ScheduleWeekly < ActiveRecord::Base
	belongs_to :spot
	has_many :action_weeklies
end
