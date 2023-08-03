# frozen_string_literal: true

class Organizer < User
  has_many :tours, as: :organizer, dependent: :destroy

  # after_create_commit { broadcast_append_to "organizers" }
end
