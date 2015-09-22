FactoryGirl.define do
	factory :location do |l|
		l.name "Test location"
		l.address "Test address"
		l.homepage "http://validhomepage.com"
		l.phonenumber "123-3456"
	end
	factory :location_without_name, class: Location do |l|
		l.name nil
		l.address "Test address"
		l.homepage "http://validhomepage.com"
		l.phonenumber "123-3456"
	end
	factory :location_invalid_homepage, class: Location do |l|
		l.name "Test location"
		l.address "Test address"
		l.homepage "<0djsas.com"
		l.phonenumber "123-3456"
	end
end