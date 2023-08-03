# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(Organizer)
      can :manage, Tour, organizer_id: user.id
      can :manage, Collaborate
    elsif user.is_a?(Partner)
      can :manage, Hotel, hotel_id: user.id

    elsif user.is_a?(Traveller)
      can :read, Tour
      can :manage, Booking

    end  
    
  end
end
