# frozen_string_literal: true

class ToursController < ApplicationController
  before_action :authenticate_user!
  before_action :find_organizer_id, only: %i[index new create show edit update destroy]
  before_action :find_tour_id, only: %i[show edit update destroy]

  def index
    @tours = @organizer.tours
  end

  def new
    @tour = @organizer.tours.new
  end

  def create
    @tour = @organizer.tours.new(set_params)
    respond_to do |format|
      if @tour.save
        format.html { redirect_to organizer_tour_path(id: @tour.id), flash: { notice: 'Tour is created succesfully' } }

      else
        format.html { render action: 'new' }
      end
    end
  end

  def show; end

  def edit
  end

  def update
    respond_to do |format|
      if @tour.update(set_params)
        format.html { redirect_to organizer_tour_path, flash: { notice: 'Tour is updated succesfully.' } }
      else
        render :edit
      end
    end
  end

  def destroy
    @tour.collaborates.delete_all
    @tour.destroy

    redirect_to organizer_tours_path(@organizer)
  end

  private

  def find_tour_id
    @tour = @organizer.tours.find(params[:id])
  end

  def set_params
    params.require(:tour).permit(:destination_name, :pickup_and_dropping_point, :pickup_date, :dropping_date,
                                 :inclusions, :amount, images: [])
  end

  def find_organizer_id
    @organizer = Organizer.find(current_user.id)
  end
end
