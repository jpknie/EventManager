FactoryGirl.define do
	factory :event do |e|
		e.title "TestPlace"
		e.description "TestDescription"
		e.start_date Date.today
		e.end_date Date.today + 1
		e.location_id nil
	end
end