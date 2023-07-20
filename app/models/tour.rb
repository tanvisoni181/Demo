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

  validate :pickup_date_cannot_be_in_the_past
  validate :dropping_date_cannot_be_in_the_past
  validates :destination_name, :pickup_and_dropping_point, :pickup_date, :dropping_date, :amount, :inclusions, presence:true


  private
  def pickup_date_cannot_be_in_the_past
    if pickup_date.present? && pickup_date < Date.today
      errors.add(:pickup_date, "can't be in the past")
    end
  end 

  def dropping_date_cannot_be_in_the_past
    if dropping_date.present? && dropping_date < Date.today
      errors.add(:dropping_date, "can't be in the past")
    end
  end 
end
