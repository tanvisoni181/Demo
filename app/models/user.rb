class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   

   #Roles of user
   
   enum :role, %i{ Organizer Traveller Partner}   
   has_one :organizer
   # has_one :traveller  

end
