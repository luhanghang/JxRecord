class RecordFile < ActiveRecord::Base
  belongs_to :spot
  belongs_to :gateway
  default_scope :order => 'record_date'
end
