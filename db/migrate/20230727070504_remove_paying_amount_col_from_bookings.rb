# frozen_string_literal: true

class RemovePayingAmountColFromBookings < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookings, :paying_amount, :total_amount
  end
end
