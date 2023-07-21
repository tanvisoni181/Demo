class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  

  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end
  
  validate :only_one_admin_user

  private
   def only_one_admin_user
    if AdminUser.exists? && !self.persisted?
      errors.add(:base, "Only one admin user can be created.")
    end
  end
  
end
