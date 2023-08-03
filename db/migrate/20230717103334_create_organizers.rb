# frozen_string_literal: true

class CreateOrganizers < ActiveRecord::Migration[7.0]
  def change
    create_table :organizers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :phone_no

      t.timestamps
    end
  end
end
