class Place < ApplicationRecord

  has_many :matches

  validates :name, uniqueness: true

end
