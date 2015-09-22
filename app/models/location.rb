class Location < ActiveRecord::Base
	has_many :events
	validates :homepage, :url => {:allow_nil => true}
end
