class Organizer < ApplicationRecord
	belongs_to :user
	has_many :tours, dependent: :destroy 
	

	validates :first_name, :last_name, :address, presence:true
	validates :phone_no, length: {is:10}, presence:true


end
