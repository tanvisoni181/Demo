class Collaborate < ApplicationRecord

   def self.ransackable_attributes(auth_object = nil)
    ["created_at", "hotel_id", "id", "no_of_rooms", "organizer_id", "room_type", "updated_at"]
  end

  
  belongs_to :hotel
  belongs_to :tour

   # validates :room_type, :no_of_rooms,:date, presence: true
     # validates :tour_id, :hotel_id, uniqueness:true

  enum :room_type, %i{ Delux Premium Suite }
end
