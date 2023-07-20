class Tour < ApplicationRecord
	
	def self.ransackable_attributes(auth_object = nil)
    ["amount", "created_at", "destination_name", "dropping_date", "id", "images", "inclusions", "pickup_and_dropping_point", "pickup_date", "tourable_id", "tourable_type", "updated_at"]
  end
    def self.ransackable_associations(auth_object = nil)
    ["images_attachments", "images_blobs", "tourable"]
  end
  belongs_to :organizer
  has_many :collaborates
  has_many :hotels, through: :collaborates
	has_many_attached :images
end
