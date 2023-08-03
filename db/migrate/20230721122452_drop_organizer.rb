# frozen_string_literal: true

class DropOrganizer < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :tours, column: :organizer_id
    remove_reference :organizers, :user
    drop_table :organizers, force: :cascade
  end
end
