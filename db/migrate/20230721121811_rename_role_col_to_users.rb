# frozen_string_literal: true

class RenameRoleColToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :role, :string
    rename_column :users, :role, :type
  end
end
