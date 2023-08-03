# frozen_string_literal: true

class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :phone_no, :integer
    add_column :users, :address, :string
  end
end
