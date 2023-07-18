class Tour < ApplicationRecord
	
	def self.ransackable_attributes(auth_object = nil)
    ["amount", "created_at", "destination_name", "dropping_date", "id", "images", "inclusions", "pickup_and_dropping_point", "pickup_date", "tourable_id", "tourable_type", "updated_at"]
  end
	belongs_to :tourable , polymorphic:true
end
