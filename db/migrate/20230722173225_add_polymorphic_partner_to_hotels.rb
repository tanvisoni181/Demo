# frozen_string_literal: true

class AddPolymorphicPartnerToHotels < ActiveRecord::Migration[7.0]
  def change
    add_reference :hotels, :partner, polymorphic: true
  end
end
