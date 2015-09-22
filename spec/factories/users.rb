require 'faker'

FactoryGirl.define do
	factory :user do |u|
		u.email { Faker::Internet.email }
		u.password { Faker::Internet.password }
	end

	factory :user_invalid_email, class: User do |u|
		u.email "<invalid3email"
		u.password { Faker::Internet.password }
	end
end