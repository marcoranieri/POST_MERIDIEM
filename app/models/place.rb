class Place < ApplicationRecord

  has_many :matches

  validates :name, uniqueness: true

 # scope :open_now, -> (day, time) { where("weekday = ? AND open_time <= ? AND close_time > ?", day, time, time) }
end
