class AddOrganizerRefToTours < ActiveRecord::Migration[7.0]
  def change
    add_reference :tours, :organizer, foreign_key: true, null: false
  end
end
