# frozen_string_literal: true

class RenameAmountColToBookings < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookings, :amount, :paying_amount
    rename_column :bookings, :traveller_count, :no_of_travellers
    add_column :bookings, :payment_status, :string, null: false, default: 'pending'
    add_column :bookings, :stripe_charge_id, :string
    add_column :bookings, :payment_date, :datetime
  end
end
