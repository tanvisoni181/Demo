class Booking < ApplicationRecord
  belongs_to :tour
  belongs_to :traveller
end
