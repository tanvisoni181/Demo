class Partner < User
	has_many :hotels, as: :partner, dependent: :destroy
	
end