# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.ransackable_attributes(_auth_object = nil)
    %w[address created_at current_sign_in_at current_sign_in_ip email encrypted_password id
       last_sign_in_at last_sign_in_ip name phone_no remember_created_at reset_password_sent_at reset_password_token sign_in_count type updated_at]
  end

  self.inheritance_column = :type

  def self.types
    %w[Organizer Partner Traveller]
  end

  validates :name, :address, presence: true
  validates :phone_no, length: { is: 10 }, presence: true
  validates :email, uniqueness: true
end
