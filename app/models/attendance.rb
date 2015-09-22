class Attendance < ActiveRecord::Base
	STATUSES = ["No", "Maybe", "Yes"]
	belongs_to :user
	belongs_to :event
	validates :user_id, :event_id, presence: true
end
