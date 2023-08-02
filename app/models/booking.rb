class Booking < ApplicationRecord
  belongs_to :tour
  belongs_to :traveller, polymorphic: true
  
  validates :traveller_name, :email, presence:true
  validates :traveller_id, presence: true
  validates :tour_id, presence:true

  validates :no_of_travellers, numericality: { greater_than: 0 }
  # validates :numericality: { greater_than_or_equal_to: 0 }
  validates :payment_status, inclusion: { in: ['pending', 'paid', 'refunded', 'failed'] }
end
