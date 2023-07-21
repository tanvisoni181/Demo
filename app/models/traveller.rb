class Traveller < ApplicationRecord
	has_many :bookings
	has_many :tours , through: :bookings
end
