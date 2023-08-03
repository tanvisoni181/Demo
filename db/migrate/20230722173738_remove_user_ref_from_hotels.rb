# frozen_string_literal: true

class RemoveUserRefFromHotels < ActiveRecord::Migration[7.0]
  def change
    remove_reference :hotels, :user
  end
end
