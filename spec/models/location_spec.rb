require 'rails_helper'

describe Location do
	it "has a valid factory" do
		expect(FactoryGirl.create(:location)).to be_valid
	end
	it "fails to create an instance if name is not present" do
		expect(FactoryGirl.build(:location_without_name)).to be_invalid
	end
	it "fails if homepage is not valid" do
		expect(FactoryGirl.build(:location_invalid_homepage)).to be_invalid
	end
end