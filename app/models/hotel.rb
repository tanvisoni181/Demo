class Hotel < ApplicationRecord
    validates :hotel_name, :city, presence:true 
	def self.ransackable_attributes(auth_object = nil)
    ["city", "created_at", "hotel_name", "id", "updated_at"]
  end
end
