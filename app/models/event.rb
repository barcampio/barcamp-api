class Event < ApplicationRecord
	validates :facebook_id, presence: true
end
