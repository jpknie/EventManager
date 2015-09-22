class Event < ActiveRecord::Base
	has_many :attendances, dependent: :destroy
	has_many :users, through: :attendances
	belongs_to :user
	belongs_to :location
end
