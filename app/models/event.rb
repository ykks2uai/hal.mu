class Event < ActiveRecord::Base
	belongs_to :user
	has_many :event_attendances
	has_many :albums
end
