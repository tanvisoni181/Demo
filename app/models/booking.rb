class Booking < ApplicationRecord
  belongs_to :tour
  belongs_to :traveller, polymorphic: true

  validates :traveller_count, :amount,:traveller_name,:email, presence:true
  validates :traveller_id, presence: true
end
