class Hotel < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
      ["city", "created_at", "hotel_name", "id", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
      ["collaborates", "organizers"]
    end
  

    has_many :collaborates
    has_many :tours, through: :collaborates
    
    validates :hotel_name, :city, presence:true 

end
