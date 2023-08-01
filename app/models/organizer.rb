class Organizer < User
	
	has_many :tours, as: :organizer, dependent: :destroy 

	has_many :messages, dependent: :destroy
	# after_create_commit { broadcast_append_to "organizers" }
end
