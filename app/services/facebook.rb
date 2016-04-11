class Facebook
	def initialize
		@api = Koala::Facebook::API.new(Rails.application.secrets.facebook_token)
	end

	def get_event(event_id)
		@api.get_object(event_id, { fields: ['description','attending_count','end_time','start_time','cover','name','id','place','interested_count','updated_time','category']})
	end

	private 

	def api_token
		"#{Rails.application.secrets.facebook_id}|{Rails.application.secrets.facebook_secret}"
	end
end