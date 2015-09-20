require 'rails_helper'

describe Event do
	it "has a valid factory" do
		FactoryGirl.create(:event).should be_valid
	end
	it "destroys attendances when destroyed"
end