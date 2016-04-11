class Event < ApplicationRecord
	validates :facebook_id, presence: true

	def update_facebook
		self.payload = Facebook.new.get_event(facebook_id)
		self.start_at = payload['start_time'].to_time
		self.end_at = payload['end_time'].to_time
	end
end
