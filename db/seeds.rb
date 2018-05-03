require 'google_places'
require 'geokit'
require "awesome_print"
require 'google-maps'
require 'geocoder'
require 'pry'

Geokit::Geocoders::GoogleGeocoder.api_key = ENV['google_geocoding_key_seeds']

# RESET SEEDS ---------
Match.destroy_all
#Place.destroy_all
# ---------------------

User.create(email:"test@test.com", password: "test@test.com")
User.create(email:"Sonia@test.com", password: "Sonia@test.com")


client = GooglePlaces::Client.new(ENV['google_places_key_seeds'])

puts "Type the restraurant"
restaurant = "restaurant|bar|cafe"

puts "Type the location"
location = "corso como 10, milano"

coords = Geokit::Geocoders::GoogleGeocoder.geocode(location)

p coords


lat = 45.463024
lng = 9.186179
hash_rest = {}
client.spots(lat, lng, { radius: 3000, rankby: "distance", types: "cafe", detail: true}).each do |rest|

# we create a new Place Object
  place = Place.new

# we assign params through google_places
  place.latitude = rest[:lat]
  place.longitude = rest[:lng]
  place.name = rest[:name]
  place.address = rest[:formatted_address]
  place.phone_number = rest[:international_phone_number]
  place.website = rest[:website]
  place.urlmaps = rest[:url]

# nice display of TIMETABLE
  unless rest.opening_hours.nil?
    rest.opening_hours["weekday_text"].each do |key, array|
      "#{key}"
      #puts array
    end
  end

# we store the full OBJ in a Hash (type JsonB on model) so we will carry also REVIEWS and PHOTO
  place.google_data = rest

# we save the instance
  place.save

# Diplay the info on terminal
   p place.name
   place.address
   # place.timetable.gsub(/["\\\[\]]/, '').split(", /\w/") unless place.timetable.nil?

   "TOT Reviews N° #{place.google_data["reviews"].size}"

  #puts place.google_data["reviews"]["text"]

# # # Photo LINK
# https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=PHOTO-REFERENCE-HERE&key=AIzaSyBSy-fahBAu25vH9WsuZuUd_jS2P6trgp8
# https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=PHOTO-REFERENCE-HERE&key=AIzaSyBSy-fahBAu25vH9WsuZuUd_jS2P6trgp8
# https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=PHOTO-REFERENCE-HERE&key=AIzaSyBSy-fahBAu25vH9WsuZuUd_jS2P6trgp8
# https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=PHOTO-REFERENCE-HERE&key=AIzaSyBSy-fahBAu25vH9WsuZuUd_jS2P6trgp8
# https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=PHOTO-REFERENCE-HERE&key=AIzaSyBSy-fahBAu25vH9WsuZuUd_jS2P6trgp8

  # ---> Searching reviews ( array of hashes)
  # ---> @place.google_data["reviews"]

# # # Photo LINK
# https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=PHOTO-REFERENCE-HERE&key=AIzaSyBSy-fahBAu25vH9WsuZuUd_jS2P6trgp8

  # ---> Searching reviews ( array of hashes)
  # ---> @place.google_data["reviews"]

  # puts "--------Distance from #{location} --------"
  # sleep 0.3
  # if hash_rest.has_key?(Google::Maps.distance(location, rest[:vicinity]).split(" ")[0].to_f)
  #   hash_rest[Google::Maps.distance(location, rest[:vicinity]).split(" ")[0].to_f] << rest.name
  #  else
  #   hash_rest.store(Google::Maps.distance(location, rest[:vicinity]).split(" ")[0].to_f,[rest.name])
  # end
 # duration = Google::Maps.duration(location, rest[:vicinity])
  # hash_rest.store(distance.first.to_f,array)
end
