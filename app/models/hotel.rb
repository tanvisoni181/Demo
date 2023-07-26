class Hotel < ApplicationRecord

    belongs_to :partner, polymorphic:true
    has_many :collaborates
    has_many :tours, through: :collaborates
    
    validates :hotel_name, :city, :partner_id, presence:true 

end
