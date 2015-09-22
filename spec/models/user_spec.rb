require 'rails_helper'

describe User do
	it "has a valid factory" do
		expect(FactoryGirl.create(:user)).to be_valid
	end
	it "destroys attendances when destroyed" do
		#1) Create user and event instances
		event = FactoryGirl.create(:event)
		user = FactoryGirl.create(:user)

		#2) Create attendance instance and associate user and event with it
		attendance = Attendance.new
		attendance.user_id = event.id
		attendance.event_id = user.id
		attendance.save

		#3) Destroy user instance, and assert that attendance is destroyed with it
		user.destroy
		assert Attendance.where(user_id: user.id).present? == false
	end
end