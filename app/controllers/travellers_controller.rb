class TravellersController < ApplicationController
  def index
    # @tours = Tour.all
    @tours = Tour.order(created_at: :desc).page(params[:page]).per(3)
    respond_to do |format|
        format.html  
      end

  end

  def show
    @traveller = Traveller.find(current_user.id)
    @tour = Tour.find(params[:id])
  end

end
