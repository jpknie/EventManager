require 'rails_helper'

describe Attendance do
	it "fails to create instance if user and event is not present" do
		a = Attendance.new
		expect(a).to be_invalid
	end
	it "fails to create instance if user is not present" do
		a = Attendance.new
		a.event = FactoryGirl.create(:event)
		expect(a).to be_invalid
	end
	it "fails to create instance if event is not present" do
		a = Attendance.new
		a.user = FactoryGirl.create(:user)
		expect(a).to be_invalid
	end
	it "succeeds if event and user are present" do
		a = Attendance.new
		a.user = FactoryGirl.create(:user)
		a.event = FactoryGirl.create(:event)
		expect(a).to be_valid
	end
end