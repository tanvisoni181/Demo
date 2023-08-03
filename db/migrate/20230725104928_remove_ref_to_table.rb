# frozen_string_literal: true

class RemoveRefToTable < ActiveRecord::Migration[7.0]
  def change
    remove_reference :tours, :user
    add_reference :tours, :organizer, polymorphic: true
  end
end
