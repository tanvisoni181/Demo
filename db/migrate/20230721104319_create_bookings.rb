# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :tour, null: false, foreign_key: true
      t.references :traveller, null: false, foreign_key: true
      t.datetime :booking_date, default: '2023-07-05 10:33:00'
      t.integer :booking_id
      t.integer :traveller_count
      t.integer :amount
      t.index ['booking_id'], name: 'index_bookings_on_booking_id'

      t.timestamps
    end
  end
end
