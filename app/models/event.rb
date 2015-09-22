class Event < ActiveRecord::Base
	has_many :attendances, dependent: :destroy
	has_many :users, through: :attendances
	belongs_to :user
	belongs_to :location
	validates :title, presence: true
	validate :chronological_dates

	def chronological_dates
		if self.start_date > self.end_date
			errors.add(:start_date, "is later than end date!")
		end
	end
end
