require 'google_places'
require 'geokit'
require "awesome_print"
require 'google-maps'
require 'geocoder'
require 'pry'

Geokit::Geocoders::GoogleGeocoder.api_key = 'AIzaSyCOJMoMBpaKE6ATSILodZjqQ5g2m5fWGps'
Place.destroy_all
client = GooglePlaces::Client.new("AIzaSyBSy-fahBAu25vH9WsuZuUd_jS2P6trgp8")

puts "Type the restraurant"
restaurant = "restaurant"

puts "Type the location"
location = "via aosta 4 milano"

coords = Geokit::Geocoders::GoogleGeocoder.geocode(location)

hash_rest = {}

client.spots(coords.lat, coords.lng, { radius: 2000, rankby: "distance", types: restaurant, detail: true}).each do |rest|

  puts "* * * * * * * * * * * *"
  puts ""
  puts "* * * * * * * * * * * *"
# we create a new Place Object
  place = Place.new

# we assign params through google_places
  place.latitude = rest[:lat]
  place.longitude = rest[:lng]
  place.name = rest[:name]
  place.address = rest[:formatted_address]
  place.phone_number = rest[:international_phone_number]
  place.website = rest[:website]
  # place.timetable = rest[:opening_hours][:periods][:weekday_text]
  place.urlmaps = rest[:url]

#we store the full OBJ in a Hash (type JsonB on model) so we will carry also REVIEWS and PHOTO
  place.google_data = rest

# we save the instance
  place.save

# Diplay the info on terminal
  puts "place id: #{place.id}"
  puts place.name
  puts place.address
  puts place.website

  # puts place.timetable

  puts "TOT Reviews N° #{place.google_data["reviews"].size}"

  puts place.google_data["reviews"]



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
