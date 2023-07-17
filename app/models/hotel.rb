class Hotel < ApplicationRecord
	def self.ransackable_attributes(auth_object = nil)
    ["city", "created_at", "hotel_name", "id", "updated_at"]
  end
end
