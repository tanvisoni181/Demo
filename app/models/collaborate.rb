class Collaborate < ApplicationRecord

   def self.ransackable_attributes(auth_object = nil)
    ["created_at", "hotel_id", "id", "no_of_rooms", "organizer_id", "room_type", "updated_at"]
  end

  
  belongs_to :hotel
  belongs_to :organizer

  # validates :room_type, :no_of_rooms, presence: true

  enum :room_type, %i{ Delux Premium Suite }
end
