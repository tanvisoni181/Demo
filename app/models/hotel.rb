# frozen_string_literal: true

class Hotel < ApplicationRecord

  def self.ransackable_attributes(auth_object = nil)
    ["city", "created_at", "hotel_name", "id", "partner_id", "partner_type", "updated_at"]
  end

   def self.ransackable_associations(auth_object = nil)
    ["collaborates", "partner", "tours"]
  end

  paginates_per 10
  belongs_to :partner, polymorphic: true
  has_many :collaborates, dependent: :destroy
  has_many :tours, through: :collaborates

  validates :hotel_name, :city, presence: true
end
