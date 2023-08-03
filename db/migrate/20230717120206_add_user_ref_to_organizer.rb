# frozen_string_literal: true

class AddUserRefToOrganizer < ActiveRecord::Migration[7.0]
  def change
    add_reference :organizers, :user, null: false, foreign_key: true
  end
end
