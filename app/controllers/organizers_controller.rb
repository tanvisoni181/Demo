# frozen_string_literal: true

class OrganizersController < ApplicationController
  def show
    @organizer = Organizer.find(params[:id])
  end
end
