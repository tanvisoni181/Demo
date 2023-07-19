class Hotel < ApplicationRecord
    has_many :collaborates
    has_many :organizers, through: :collaborates
    
    validates :hotel_name, :city, presence:true 
	
    def self.ransackable_attributes(auth_object = nil)
    ["city", "created_at", "hotel_name", "id", "updated_at"]
    end

end
