require 'rails_helper'

describe User do
	it "has a valid factory" do
		expect(FactoryGirl.create(:user)).to be_valid
	end

	it "fails to create user instance with invalid email format" do
		expect(FactoryGirl.build(:user_invalid_email)).to be_invalid
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

		#3) Destroy user instance, and assert that attendance is destroyed with it
		user.destroy
		assert Attendance.where(user_id: user.id).present? == false
	end
end