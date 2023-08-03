# frozen_string_literal: true

class RemoveRefFromBooking < ActiveRecord::Migration[7.0]
  def change
    remove_reference :bookings, :user
    add_reference :bookings, :traveller, polymorphic: true
    remove_column :bookings, :booking_id
  end
end
