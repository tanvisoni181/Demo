class Organizer < ApplicationRecord

	def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "first_name", "id", "last_name", "phone_no", "updated_at", "user_id"]
  end

	belongs_to :user
	has_many :tours, dependent: :destroy 
	

	validates :first_name, :last_name, :address, presence:true
	validates :phone_no, length: {is:10}, presence:true


end
