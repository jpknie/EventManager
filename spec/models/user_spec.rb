require 'rails_helper'

describe User do
	it "has a valid factory" do
		FactoryGirl.create(:user).should be_valid
	end
	it "destroys attendances when destroyed"
	#	1) Create Attendance.new with user_id and event_id
	#   2) Destroy event
    #   3) Check that Attendance is removed
end