class TravellersController < ApplicationController
  def index
    @tours = Tour.all
  end

  def show
    @traveller = Traveller.find(current_user.id)
    @tour = Tour.find(params[:id])
  end

end
