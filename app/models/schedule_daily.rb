class ScheduleDaily < ActiveRecord::Base
  belongs_to :spot
  default_scope :order => 'schedule_date'
  has_many :action_dailies
end
