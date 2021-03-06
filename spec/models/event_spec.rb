require 'rails_helper'

describe Event do
	it "has a valid factory" do
		expect(FactoryGirl.create(:event)).to be_valid
	end
	it "destroys attendances when destroyed" do
		#1) Create user and event instances
		event = FactoryGirl.create(:event)
		user = FactoryGirl.create(:user)

		#2) Create attendance instance and associate user and event with it
		attendance = Attendance.new
		attendance.user = user
		attendance.event = event
		attendance.save

		#3) Destroy event instance, and assert that attendance is destroyed with it
		event.destroy
		assert Attendance.where(event_id: event.id).present? == false
	end
	it "fails if start and end date are not in chronological order" do
		expect(FactoryGirl.build(:event_invalid_dates)).to be_invalid
	end
end