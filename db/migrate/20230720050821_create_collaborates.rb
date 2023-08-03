# frozen_string_literal: true

class CreateCollaborates < ActiveRecord::Migration[7.0]
  def change
    create_table :collaborates do |t|
      t.references :tour, null: false, foreign_key: true
      t.references :hotel, null: false, foreign_key: true
      t.integer :room_type
      t.integer :no_of_rooms
      t.date :date

      t.timestamps
    end
  end
end
