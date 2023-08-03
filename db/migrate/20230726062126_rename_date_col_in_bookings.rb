# frozen_string_literal: true

class RenameDateColInBookings < ActiveRecord::Migration[7.0]
  def change
    rename_column :collaborates, :date, :check_in
    add_column :collaborates, :check_out, :date
  end
end
