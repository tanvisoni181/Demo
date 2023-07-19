class AddColNoOfRoomsToCollaborates < ActiveRecord::Migration[7.0]
  def change
    add_column :collaborates, :no_of_rooms, :integer
    add_column :collaborates, :room_type, :integer 
  end
end
