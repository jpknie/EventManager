class Location < ActiveRecord::Base
	has_many :events
	validates :homepage, :url => {:allow_nil => true}
	validates :name, presence: true, allow_blank: false
end
