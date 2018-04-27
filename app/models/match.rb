class Match < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :place, uniqueness: { scope: :user }
end
