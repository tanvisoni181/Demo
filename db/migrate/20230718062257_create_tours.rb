# frozen_string_literal: true

class CreateTours < ActiveRecord::Migration[7.0]
  def change
    create_table :tours do |t|
      t.string :destination_name
      t.string :pickup_and_dropping_point
      t.date :pickup_date
      t.date :dropping_date
      t.string :inclusions
      t.string :images
      t.integer :amount
      t.string :tourable_type, null: false
      t.integer :tourable_id, null: false

      t.timestamps
    end
  end
end
