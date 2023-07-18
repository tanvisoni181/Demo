class CreateTravellers < ActiveRecord::Migration[7.0]
  def change
    create_table :travellers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :phone_no
      t.integer :no_of_seats
      t.integer :paying_amount

      t.timestamps
    end
  end
end
