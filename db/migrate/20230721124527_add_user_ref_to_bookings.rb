# frozen_string_literal: true

class AddUserRefToBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :traveller_id
    add_reference :bookings, :user, null: false, foreign_key: true
  end
end
