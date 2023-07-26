class Collaborate < ApplicationRecord
  belongs_to :hotel
  belongs_to :tour


  enum :room_type, %i{ Delux Premium Suite }

  validate :correct_check_in_date
  validate :correct_check_out_date
  validates :room_type, :no_of_rooms,:check_in,:check_out, presence: true


  private
  def correct_check_in_date
    if check_in.present? && check_in < Date.today
      errors.add(:check_in, "can't be in the past")
    end
  end 

  def correct_check_out_date
    if check_out.present? && check_out < Date.today
      errors.add(:check_out, "can't be in the past")
    end
  end 
end
