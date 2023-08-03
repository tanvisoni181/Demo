# frozen_string_literal: true

class OrganizersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @organizer = Organizer.find(params[:id])
  end
end
