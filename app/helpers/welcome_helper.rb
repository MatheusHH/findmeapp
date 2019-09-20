module WelcomeHelper
	def distance(lat, long, latitude, longitude)
		Geocoder::Calculations.distance_between([lat,long], [latitude,longitude]).round(2)
	end
end
