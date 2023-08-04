# frozen_string_literal: true

class TravellersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    # @tours = Tour.all
    @tours = Tour.order(created_at: :desc).page(params[:page]).per(3)
    respond_to(&:html)
  end

  def show
    @traveller = Traveller.find(current_user.id)
    @tour = Tour.find(params[:id])
  end
end
