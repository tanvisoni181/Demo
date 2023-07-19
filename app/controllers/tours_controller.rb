class ToursController < ApplicationController

   before_action :find_organizer_id , only: %i[ index new create show edit update destroy ] 
   before_action :find_tour_id, only: %i[ show edit update destroy ] 
  def index
    @tours = @organizer.tours.all
  end
  def new
    @tour = Tour.new
  end

  def create
    @tour = @organizer.tours.new(set_params)
    @tour.images.attach(params[:images])

    if @tour.save
      redirect_to organizer_tour_path(id: @tour.id)
    else
      render new
    end
  end

  def show
    @tour.images.attach(params[:images])
  end

  def edit
   
     @tour.images.attach(params[:images])
  end

  def update
    if @tour.update(set_params)
      redirect_to organizer_tour_path
    else
      render :edit 
    end
  end

  def destroy
    @tour.destroy

    redirect_to organizer_tours_path
  end

  private
  def set_params
    params.require(:tour).permit(:destination_name,:pickup_and_dropping_point,:pickup_date,:dropping_date,
      :inclusions,:amount,:tourable_id,:tourable_type,images: [])
  end

  def find_organizer_id
     organizer_id = current_user.organizer.id 
     @organizer = Organizer.find(organizer_id)
  end
  def find_tour_id
    @tour = @organizer.tours.find(params[:id])
  end
end
