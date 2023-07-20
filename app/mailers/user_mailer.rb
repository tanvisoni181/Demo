class UserMailer < ApplicationMailer
	default from: 'notifications@example.com'

	def welcome_email
		@user = params[:user]
		@url = 'login'
		mail(to: @user.email, subject: 'Welcome to GoTravel')
	end
end

