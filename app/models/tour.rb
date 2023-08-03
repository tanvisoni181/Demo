# frozen_string_literal: true

class Tour < ApplicationRecord
  paginates_per 10
  belongs_to :organizer, polymorphic: true

  has_many :collaborates, dependent: :destroy
  has_many :hotels, through: :collaborates

  has_many_attached :images

  has_many :bookings, dependent: :destroy
  has_many :travellers, through: :bookings

  validate  :validate_pickup_and_dropping_date
  validates :destination_name, presence: true
  validates :pickup_and_dropping_point, presence: true
  validates :amount, presence: true
  validates :inclusions, presence: true
  validates :pickup_date, presence: true
  validates :dropping_date, presence: true

  private

  def validate_pickup_and_dropping_date
    errors.add(:pickup_date, "can't be in the past") if pickup_date.present? && pickup_date < Date.today
    return unless dropping_date.present? && dropping_date < Date.today

    errors.add(:dropping_date, "can't be in the past")
  end
end
