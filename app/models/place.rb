class Place < ApplicationRecord
  # GOOGLE_API_KEY = "AIzaSyCphxuvUrZsX8xRq5rA9TZy-cgYTSHvCyU"

  has_many :matches

  validates :name, uniqueness: true

 # scope :open_now, -> (day, time) { where("weekday = ? AND open_time <= ? AND close_time > ?", day, time, time) }

  def image_url
    # photo_reference = self.google_data["photos"][0]["photo_reference"]

    # randon_number = rand(1..4).to_s
    # api_key = ENV['google_api_key_' + randon_number]

    # url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{photo_reference}&key=#{api_key}"
    url = "https://loremflickr.com/600/400/bar,cocktail?lock=#{self.id}"
  end
end
