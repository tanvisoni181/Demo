# frozen_string_literal: true

class AddNotNullUserRefToTours < ActiveRecord::Migration[7.0]
  def change
    remove_column :tours, :organizer_id
    add_reference :tours, :user, foreign_key: true
  end
end
