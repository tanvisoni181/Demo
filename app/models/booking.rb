# frozen_string_literal: true

class Booking < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "no_of_travellers", "payment_date", "payment_status", "stripe_charge_id", "total_amount", "tour_id", "traveller_id", "traveller_name", "traveller_type", "updated_at"]
  end
  
  belongs_to :tour
  belongs_to :traveller, polymorphic: true

  validates :traveller_name, :email, presence: true
  validates :traveller_id, presence: true
  validates :tour_id, presence: true

  validates :no_of_travellers, numericality: { greater_than: 0 }
  # validates :numericality: { greater_than_or_equal_to: 0 }
  validates :payment_status, inclusion: { in: %w[pending paid refunded failed] }
end
