class CreateCollaborates < ActiveRecord::Migration[7.0]
  def change
    create_table :collaborates do |t|
      t.references :hotel, null: false, foreign_key: true
      t.references :organizer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
