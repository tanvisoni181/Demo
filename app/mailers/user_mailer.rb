# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'gotravel@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'signup'
    mail(to: @user.email, subject: 'Welcome to GoTravel')
  end

  def booking_confirmation
    @organizer = params[:organizer]
    @traveller = params[:traveller]
    @booking = params[:booking]

    mail(to: @traveller.email, subject: 'Your Tour booking is confirmed')
    # mail(to: @organizer.email, subject: "Booking confirmation for your Tour")
  end

  def collaboration_confirmation
    @partner = params[:partner]
    @organizer = params[:organizer]
    @hotel = params[:hotel]

    mail(to: @partner.email, subject: 'Your hotel is booked ')
    mail(to: @organizer.email, subject: 'Booked hotel for tour')
  end
end
