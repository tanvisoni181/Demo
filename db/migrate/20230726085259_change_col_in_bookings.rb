# frozen_string_literal: true

class ChangeColInBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :booking_date, :date
    add_column :bookings, :traveller_name, :string
    add_column :bookings, :email, :string
  end
end
