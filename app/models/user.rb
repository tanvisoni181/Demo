class User < ApplicationRecord
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  self.inheritance_column = :type 

  def self.types
    %w[Organizer Partner Traveller]
  end      

  validates :name ,:address, presence:true
  validates :phone_no, length: {is:10}, presence:true
  validates :email, uniqueness: true


end
