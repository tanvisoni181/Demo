# frozen_string_literal: true

class Traveller < User
  has_many :bookings, as: :traveller, dependent: :destroy
  has_many :tours, through: :bookings
end
