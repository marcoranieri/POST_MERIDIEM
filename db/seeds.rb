require 'google_places'
require 'geokit'
require "awesome_print"
require 'google-maps'
require 'geocoder'
require 'pry'

Geokit::Geocoders::GoogleGeocoder.api_key = 'AIzaSyCOJMoMBpaKE6ATSILodZjqQ5g2m5fWGps'

client = GooglePlaces::Client.new("AIzaSyBSy-fahBAu25vH9WsuZuUd_jS2P6trgp8")

puts "Type the restraurant"
restaurant = "pub"

puts "Type the location"
location = "via aosta 4 milano"

coords = Geokit::Geocoders::GoogleGeocoder.geocode(location)

hash_rest = {}

client.spots(coords.lat, coords.lng, { radius: 2, rankby: "distance", types: "restaurant"}).each do |rest|
  # puts "************"
   Pry::ColorPrinter.pp(rest)
   place = Place.new
   place.latitude = rest[:latitude]
   place.longitude = rest[:longitude]
   place.name = rest[:name]
   # ...
   place.save
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
