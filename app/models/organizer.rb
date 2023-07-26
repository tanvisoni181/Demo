class Organizer < User
	
	has_many :tours, as: :organizer, dependent: :destroy 
	



end
