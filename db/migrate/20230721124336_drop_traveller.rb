# frozen_string_literal: true

class DropTraveller < ActiveRecord::Migration[7.0]
  def change
    drop_table :travellers
  end
end
