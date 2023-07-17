class OrganizersController < ApplicationController
  def index
  end

  def new
    @organizer = Organizer.new
  end

  def create
    @organizer = current_user.build_organizer(set_params)
    if @organizer.save
      cookies[:organizer_info] = @organizer_id
      redirect_to @organizer
    else
      render new
    end
  end


  def show
    organizer = current_user.organizer
    organizer_id = organizer.id
    @organizer = Organizer.find(organizer_id)
  end

   

  private
  def set_params
    params.require(:organizer).permit(:first_name,:last_name, :phone_no,:address, :user_id)
  end
end
