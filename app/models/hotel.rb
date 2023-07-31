class Hotel < ApplicationRecord   
    paginates_per 10
    belongs_to :partner, polymorphic:true
    has_many :collaborates, dependent: :destroy
    has_many :tours, through: :collaborates
    
    validates :hotel_name, :city, presence:true 

end
