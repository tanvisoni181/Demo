class Tour < ApplicationRecord
  belongs_to :organizer, polymorphic:true
  
  has_many :collaborates
  has_many :hotels, through: :collaborates

	has_many_attached :images
  
  has_many :bookings
  has_many :travellers, through: :bookings

  validate :pickup_date_cannot_be_in_the_past
  validate :dropping_date_cannot_be_in_the_past
  validates :destination_name, :pickup_and_dropping_point, :pickup_date, :dropping_date, :amount, :inclusions, presence:true


  private
  def pickup_date_cannot_be_in_the_past
    if pickup_date.present? && pickup_date < Date.today
      errors.add(:pickup_date, "can't be in the past")
    end
  end 

  def dropping_date_cannot_be_in_the_past
    if dropping_date.present? && dropping_date < Date.today
      errors.add(:dropping_date, "can't be in the past")
    end
  end 
end
