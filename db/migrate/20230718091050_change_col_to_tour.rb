# frozen_string_literal: true

class ChangeColToTour < ActiveRecord::Migration[7.0]
  def change
    remove_column :tours, :tourable_id
    remove_column :tours, :tourable_type
  end
end
