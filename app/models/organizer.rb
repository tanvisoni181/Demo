class Organizer < ApplicationRecord
	belongs_to :user
	has_many :tours, dependent: :destroy 
	has_many :collaborates
	has_many :hotels, through: :collaborates

	validates :first_name, :last_name, :address, presence:true
	validates :phone_no, length: {is:10}, presence:true


end
